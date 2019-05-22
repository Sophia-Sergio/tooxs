class WorkShift < ApplicationRecord
  has_many :plan_shifts
  has_many :user_shifts
end
