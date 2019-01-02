# class for table departments
class StoreDepartment < ApplicationRecord
  belongs_to :store
  belongs_to :department
  has_many :achievements
  has_many :real_staffs
  has_many :plan_staffs
  has_many :real_sales
  has_many :plan_sales
  has_many :data_cases
  has_many :user_shifts
  has_many :sellers
  has_many :users
  has_many :cashiers
  has_many :target_productivities
  has_many :target_sales

  def optimized_shifts(opt)
    data_cases.find_case(opt[:month], opt[:year]).summary_cases.output.real_dot
  end

  def actual_shifts(opt)
    seller_shifts.by_year(opt[:year]).by_month(opt[:month]).shifts_staff
  end
end
