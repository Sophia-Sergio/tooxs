class PlanShift < ApplicationRecord
  belongs_to :work_shift
  scope :find_case, ->(opts) { find_by(opts.slice(:week, :day)) if %i[week day].all? { |s| opts.key? s } }
end
