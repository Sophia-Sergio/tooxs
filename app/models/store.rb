require 'rubyXL'

# Store class for stores table
class Store < ApplicationRecord
  include CommercialCalendar::Period

  has_many :users
  has_many :sellers
  has_many :cashiers
  has_many :achievements
  has_many :store_departments
  has_many :worlds, through: :store_departments
  has_many :departments, through: :store_departments
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
end
