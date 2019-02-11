class StaffRequest < ApplicationRecord
  belongs_to :store_department
  belongs_to :store
  belongs_to :plan_shift
  belongs_to :user
end
