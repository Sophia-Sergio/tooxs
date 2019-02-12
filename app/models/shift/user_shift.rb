class UserShift < ApplicationRecord
  belongs_to :user
  belongs_to :work_shift
  belongs_to :store
  enum status: { active: 1, inactive: 0 }

  scope :find_case, ->(opts) { find_by(opts.slice(:year, :month, :week)) }
  scope :between_dates, ->(period) { BetweenDatesWithoutDateAttributeQuery.new(self, period).call }

  def self.shifts_staff
    active.group(:work_shift_id).order(:work_shift_id).count
  end
end
