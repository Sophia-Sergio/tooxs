class World < ApplicationRecord
  include CommercialCalendar::Period
  has_many :store_departments
  has_many :stores, through: :store_departments
  has_many :departments, through: :store_departments

  def as_json(store_id)
    json = super(only: %i[name id])
    json['departments'] = departments_by_store(store_id) + [{ 'id' => 999, 'name' => 'Todos' }]
    json['bigger_department'] = World.find(id).
      bigger_plan_sale_department(store_id).as_json(only: %i[name id])
    json
  end

  def departments_by_store(store_id)
    departments = store_departments.where(store_id: store_id).pluck(:department_id)
    Department.where(id: departments).as_json(only: %i[name id])
  end

  def bigger_plan_sale_department(store_id, opts = {})
    opts = if opts.present?
             opts
           else
             { year: year_by_date(Date.today), month: month_by_date(Date.today) }
           end
    department_id = departments.joins(store_departments: { categories: :sales_plans }).
      merge(CategorySalesPlan.by_store_month(store_id, opts)).distinct.
      group('store_departments.department_id').
      sum('category_sales_plans.monthly').max_by { |_, v| v }.first
    Department.find(department_id)
  end
end
