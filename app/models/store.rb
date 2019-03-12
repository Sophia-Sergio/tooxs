# Store class for stores table
class Store < ApplicationRecord
  include CommercialCalendar::Period
  include Defaults

  has_many :users
  has_many :sellers
  has_many :cashiers
  has_many :achievements
  has_many :employees
  has_many :store_departments
  has_many :worlds, through: :store_departments
  has_many :departments, through: :store_departments
  has_many :sales, class_name: 'CategorySale', foreign_key: 'category_cod'
  has_many :sales_plans, class_name: 'CategorySalesPlan', foreign_key: 'category_cod'
  has_many :sales_assistants, -> { joins(:roles).where(roles: { name: 'sales_assistant' }) },
    class_name: 'Employee'
  has_many :sellers, -> { joins(:roles).where(roles: { name: 'seller' }) }, class_name: 'Employee'

  has_many :staff_reals
  belongs_to :cluster
  validates_presence_of :name,
                        :commune

  scope :by_cluster, ->(cluster = nil) { where(cluster_id: cluster).order(:name) }

  def stores_same_department(department)
    Store.where(cluster: cluster).where.not(id: id).
      joins(:departments).merge(departments.where(id: department))
  end

  def bigger_plan_sale_world(opts = {})
    opts = if opts.present?
             opts
           else
             { year: year_by_date(Date.today), month: month_by_date(Date.today) }
           end
    world_id = worlds.joins(store_departments: { categories: :sales_plans}).
      merge(CategorySalesPlan.by_store_month(id, opts)).
      group('worlds.id').sum('category_sales_plans.monthly').max_by { |k,v| v }.first
    World.find(world_id)
  end

  def efficiency(period = default_period)
    efficiencies = efficiency_by_date(period)
    efficiencies.values.sum / efficiencies.size
  end

  def efficiency_by_date(period = default_period)
    efficiencies = store_departments.each_with_object([]) do |store_dep, array|
      array << store_dep.efficiency_by_date(period)
    end
    days = (period[:end] + 1.day - period[:start]).to_i
    (period[:start]..period[:end]).each_with_object({}) do |date, hash|
      hash[date] = efficiencies.map { |efficiency| efficiency[date] }.sum / days
    end
  end

  def categories_plan_sales_between_dates(start_date, end_date)
    start_month = month_by_date(start_date)
    end_month   = month_by_date(end_date)
    start_year  = year_by_date(start_date)
    end_year    = year_by_date(end_date)
    if start_year == end_year
      store_departments.joins(categories: [:sales_plans]).where('year = ? AND month >= ? AND month <= ? AND category_sales_plans.store_id = ?',
        start_year, start_month, end_month, id).order('category_sales_plans.year, category_sales_plans.month')
    else
      store_departments.joins(categories: [:sales_plans]).where('year = ? AND month >= ? AND category_sales_plans.store_id = ?',
        start_year, start_month, store_id).or(categories.joins(:sales_plans).
        where('year = ? AND month <= ? AND category_sales_plans.store_id = ?',
        end_year, end_month, id)).order('category_sales_plans.year, category_sales_plans.month')
    end
  end

  def categories_plan_sales(period = default_period)
    categories_plan_sales_between_dates(period[:start], period[:end]).
      group(:year, :month).sum('category_sales_plans.monthly')
  end

  def categories_sales(period = default_period)
    store_departments.joins(categories: [:sales]).
      where('category_sales.date between ? AND ?', period[:start], period[:end]).
      where('category_sales.store_id = ?', id).sum('category_sales.amount')
  end

  def productivity(period = default_period)
    productivities = store_departments.each_with_object([]) do |store_dep, array|
      array << store_dep.productivity_by_date_hour(period).values.flat_map { |k, _| k.values }
    end
    productivities = productivities.flatten
    productivities.sum / productivities.size
  end

  def year_month_target_productivity(period = default_period)
    year  = year_by_date(period[:start])
    month = month_by_date(period[:start])
    target_productivities = store_departments.joins(:target_productivities).
      where('target_productivities.year = ? AND target_productivities.month = ?', year, month).pluck(:amount)
    target_productivities.sum / target_productivities.size
  end
end
