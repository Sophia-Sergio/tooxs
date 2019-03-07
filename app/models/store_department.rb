# class for table departments
class StoreDepartment < ApplicationRecord
  include Stats::Efficiency
  include Defaults
  include CommercialCalendar::Period

  PERIODS = Settings.productivity_periods_keys
  WEEK_PERIODS = Settings.productivity_week_periods_keys

  belongs_to :store, dependent: :destroy
  belongs_to :department, dependent: :destroy
  belongs_to :world, dependent: :destroy
  has_many :achievements
  has_many :real_staffs
  has_many :plan_staffs
  has_many :real_sales
  has_many :user_shifts
  has_many :users

  has_many :employees, class_name: 'Employee'
  has_many :cashiers, -> { joins(:roles).where(roles: { name: 'cashier' }) }, class_name: 'Employee'
  has_many :sales_assistants, -> { joins(:roles).where(roles: { name: 'sales_assistant' }) },
    class_name: 'Employee'
  has_many :sellers, -> { joins(:roles).where(roles: { name: 'seller' }) }, class_name: 'Employee'

  has_many :target_productivities, dependent: :destroy
  has_many :target_sales, dependent: :destroy
  has_and_belongs_to_many :categories, association_foreign_key: 'category_cod', dependent: :destroy

  enum staff: {
    asisted: 1,
    selfasisted: 2,
    personalized: 3
  }

  def categories_plan_sales_between_dates(period)
    categories.joins(:sales_plans).merge(CategorySalesPlan.between(period, store.id))
  end

  def year_month_target_productivity(period = default_period)
    year  = year_by_date(period[:start])
    month = month_by_date(period[:start])
    target_productivities = self.target_productivities.
      where(year: year, month: month).pluck(:amount)
    target_productivities.sum / target_productivities.size
  end

  def categories_sales(period = default_period)
    categories.joins(:sales).
      where('category_sales.date between ? AND ?', period[:start], period[:end]).
      where('category_sales.store_id = ?', store.id).sum('category_sales.amount')
  end

  def categories_rate_sales(period = default_period)
    old_period = old_period(period)
    sales = categories_sales_by_dates(old_period)
    sales.each_with_object({}) do |(date, value), hash|
      month_period = month_period(year_by_date(date), month_by_date(date))
      date = equivalent_date_next_year(date)
      month_sales = sales.select do |key, _|
        (month_period[:start]..month_period[:end]).to_a.include? key
      end.values.sum
      hash[date] = value / month_sales
    end
  end

  def categories_sales_by_dates(period = default_period)
    categories.joins(:sales).order('category_sales.date').
      where('category_sales.date between ? AND ?', period[:start], period[:end]).
      where('category_sales.store_id = ?', store.id).
      group(:date).sum('category_sales.amount')
  end

  def categories_sales_plan_by_dates(period = default_period)
    daily_sales_plan = categories_plan_sales_between_dates(period).
      pluck('category_sales_plans.daily')
    (period[:start]..period[:end]).each_with_object({}) do |date, hash|
      hash[date] = daily_sales_plan.map { |sales_plan| sales_plan[date.to_s].to_i }.sum
    end
  end

  def categories_plan_sales(period = default_period)
    categories_plan_sales_between_dates(period).
      group(:year, :month).sum('category_sales_plans.monthly')
  end

  def categories_sales_by_date_hour(date)
    hourly_sales = categories.joins(:sales).where(category_sales: { store_id: store, date: date }).
      pluck('category_sales.hourly')

    PERIODS.each_with_object({}) do |key, hash|
      hash[key] = hourly_sales.map { |sale| sale[key].to_i }.sum
    end
  end

  def efficiency(period = default_period)
    efficiencies = efficiency_by_date(period)
    efficiencies.values.sum / efficiencies.size
  end

  def productivity(period = default_period)
    productivities = productivity_by_date_hour(period).values.flat_map { |k, _| k.values }
    productivities.sum / productivities.size
  end

  def efficiency_by_date(period = default_period)
    prods = productivity_by_date_hour(period)
    targets = target_productivities.by_date_hour(period)
    (period[:start]..period[:end]).each_with_object({}) do |date, hash|
      abs_desviation = abs_desviation(prods[date], targets[date])
      hash[date] = day_efficiency(abs_desviation, targets[date])
    end
  end

  def productivity_by_date_hour(period = default_period)
    (period[:start]..period[:end]).each_with_object({}) do |date, hash|
      employees = self.employees.count_employees_by_hour(date)
      sales = categories_sales_by_date_hour(date)
      productivity = employees.keys.map { |hour| (sales[hour] / employees[hour].to_f).round(2) }
      hash[date] = employees.keys.zip(productivity).to_h
    end
  end

  def productivity_by_date(period = default_period)
    productivities = productivity_by_date_hour(period)
    productivity_filter_week_periods(productivities)
  end

  def target_productivity_by_date(period = default_period)
    productivities = target_productivities.by_date_hour(period)
    productivity_filter_week_periods(productivities)
  end

  private

  def productivity_filter_week_periods(productivity)
    productivity.keys.each_with_object({}) do |date, hash|
      WEEK_PERIODS.keys.each do |p|
        hash[p] ||= {}
        hash[p][date] = if date_included_on_productivity_period?(p, date)
                          period_selected = productivity[date].slice(*WEEK_PERIODS[p]).values
                          period_selected.present? ? period_selected.sum / period_selected.size : 0
                        else
                          0
                        end
      end
    end
  end
end
