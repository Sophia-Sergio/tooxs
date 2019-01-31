# class for table departments
class StoreDepartment < ApplicationRecord
  include Statistics::Efficiency
  include Statistics::Periods

  belongs_to :store, dependent: :destroy
  belongs_to :department, dependent: :destroy
  belongs_to :world, dependent: :destroy
  has_many :achievements
  has_many :real_staffs
  has_many :plan_staffs
  has_many :real_sales
  has_many :user_shifts
  has_many :users

  has_many :employees, -> { joins(:roles).where('roles.name != ?', ['admin']) }, class_name: 'User'
  has_many :cashiers, -> { joins(:roles).where('roles.name = ?', 'cashier') }, class_name: 'User'
  has_many :sales_asisstants, -> { joins(:roles).where('roles.name = ?', 'sales_assistant') }, class_name: 'User'
  has_many :sellers, -> { joins(:roles).where('roles.name = ?', 'seller') }, class_name: 'User'

  has_many :target_productivities, dependent: :destroy
  has_many :target_sales, dependent: :destroy
  has_and_belongs_to_many :categories, association_foreign_key: 'category_cod', dependent: :destroy

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

  def categories_sales(opts = {})
    opts = opts.present? ? opts : default_period
    categories.joins(:sales).
    where('category_sales.date between ? AND ?', opts[:start], opts[:end]).
    where('category_sales.store_id = ?', store.id).sum('category_sales.amount')
  end

  def categories_plan_sales(opts = {})
    opts = opts.present? ? opts : default_year_month
    categories.joins(:sales_plans).
    where('year = ? AND month = ?', opts[:year], opts[:month]).
    where('category_sales_plans.store_id = ?', store_id).sum('category_sales_plans.monthly')
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
    efficiencies = efficiency_by_date(period)
    efficiencies.values.sum / efficiencies.size
  end

  def goal_success(period = {})
    period = period.present? ? period : default_period
    categories_sales(period) / categories_plan_sales(period)
  end

  def productivity(period = {})
    period = period.present? ? period : default_period
    productivities = productivity_by_date_hour(period)
    productivities.values.sum / productivities.size
  end

  def efficiency_by_date(period = {})
    period = period.present? ? period : default_period
    prods = self.productivity_by_date_hour(period)
    targets = target_productivities.by_date_hour(period)

    hash = (period[:start]..period[:end]).each_with_object({}) do |date, hash|
      abs_desviation = self.abs_desviation(prods[date].values, targets[date].values)
      hash[date] = ((1-(abs_desviation / targets[date].values.sum)) * 100).round(2)
    end
  end

  def productivity_by_date_hour(period = {})
    period = period.present? ? period : default_period
    (period[:start]..period[:end]).each_with_object({}) do |date, hash|
      employees = self.employees.employees_by_hour(date)
      sales = self.hour_sales_by_date(date)
      productivity = employees.keys.map { |hour| (sales[hour] / employees[hour].to_f).round(2) }
      hash[date] = employees.keys.zip(productivity).to_h
    end
  end
end
