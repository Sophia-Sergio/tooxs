# class for table departments
class StoreDepartment < ApplicationRecord
  include Statistics::Efficiency

  belongs_to :store
  belongs_to :department
  belongs_to :world
  has_many :achievements
  has_many :real_staffs
  has_many :plan_staffs
  has_many :real_sales
  has_many :plan_sales
  has_many :user_shifts
  has_many :users

  # has_many :employees, -> {
  #   joins('INNER JOIN users_roles ON users.id = users_roles.user_id')
  # }, class_name: 'User'

  has_many :employees, -> { joins(:roles).where('roles.name != ?', ['admin']) }, class_name: 'User'
  has_many :cashiers, -> { joins(:roles).where('roles.name = ?', 'cashier') }, class_name: 'User'
  has_many :sales_asisstants, -> { joins(:roles).where('roles.name = ?', 'sales_assistant') }, class_name: 'User'
  has_many :sellers, -> { joins(:roles).where('roles.name = ?', 'seller') }, class_name: 'User'

  has_many :target_productivities
  has_many :target_sales
  has_and_belongs_to_many :categories, association_foreign_key: 'category_cod'

  enum staff: {
    asisted: 1,
    selfasisted: 2,
    personalized: 3,
  }

  def optimized_shifts(opt)
    data_cases.find_case(opt[:month], opt[:year]).summary_cases.output.real_dot
  end

  def actual_shifts(opt)
    seller_shifts.by_year(opt[:year]).by_month(opt[:month]).shifts_staff
  end

  def categories_sales(start_date, end_date)
    categories.joins(:sales).
    where('category_sales.date between ? AND ?', start_date, end_date).
    where('category_sales.store_id = ?', store_id).sum('category_sales.amount')
  end

  def hour_sales_by_date(date)
    hourly_sales = categories.joins(:sales).
      where(category_sales: {store_id: store, date: date}).
      pluck('category_sales.hourly')

    Settings.periods_keys.each_with_object({}) do |key, hash|
      hash[key] = hourly_sales.map { |sale| sale[key].to_i }.sum
    end
  end

  def efficiency(period = {})
    period = period.present? ? period : default_period
    prods = self.productivity_by_date_hour(period)
    targets = target_productivities.by_date_hour(period)

    hash = (period[:start]..period[:end]).each_with_object({}) do |date, hash|
      abs_desviation = self.abs_desviation(prods[date].values, targets[date].values)
      hash[date] = ((1-(abs_desviation / targets[date].values.sum)) * 100).round(2)
    end
  end

  def productivity_by_date_hour(period = {})
    period ||= default_period
    (period[:start]..period[:end]).each_with_object({}) do |date, hash|
      employees = self.employees.working_on_date(date).employees_by_hour
      sales = self.hour_sales_by_date(date)
      productivity = employees.keys.map { |hour| (sales[hour] / employees[hour].to_f).round(2) }
      hash[date] = employees.keys.zip(productivity).to_h
    end
  end
  # employees
  # {"11 - 12"=>2, "12 - 13"=>5, "13 - 14"=>7, "14 - 15"=>7, "15 - 16"=>9, "16 - 17"=>9, "17 - 18"=>9, "18 - 19"=>7, "19 - 20"=>7, "20 - 21"=>4}
  # {"10 - 11"=>1081577, "11 - 12"=>1081577, "12 - 13"=>1081577, "13 - 14"=>1081577, "14 - 15"=>1081577, "15 - 16"=>1081577, "16 - 17"=>1081577, "17 - 18"=>1081577, "18 - 19"=>1081577, "19 - 20"=>1081577, "20 - 21"=>1081577}

  private

  def default_period
    year = Settings.year_by_date(Date.today)
    month = Settings.month_by_date(Date.today)
    Settings.month_period(year, month)
  end
end
