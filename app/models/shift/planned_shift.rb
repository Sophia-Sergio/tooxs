class PlannedShift < ApplicationRecord
  belongs_to :user
  belongs_to :work_shift
end
