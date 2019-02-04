class World < ApplicationRecord
  has_many :store_departments
  has_many :departments, through: :store_departments
  attr_accessor :bigger_plan_sale_department

  def as_json
    json = super(
      include: { departments: { only: [:name, :id] } },
      only: [:name, :id])
    json['bigger_department'] = World.find(id).
      bigger_plan_sale_department.as_json(only: [:name, :id])
    json
  end

  def bigger_plan_sale_department(opts = {})
    opts = opts.present? ? opts : {
      year:  Settings.year_by_date(Date.today),
      month: Settings.month_by_date(Date.today)
    }
    department_id = departments.joins(store_departments: { categories: :sales_plans}).
      merge(CategorySalesPlan.by_store_month(store.id, opts)).distinct.
      group('store_departments.department_id').
      sum('category_sales_plans.monthly').max_by { |k,v| v }.first
    Department.find(department_id)
  end

  def store
    stores = store_departments.pluck(:store_id).uniq
    store_id = stores.join if stores.count == 1
    Store.find(store_id)
  end
end
