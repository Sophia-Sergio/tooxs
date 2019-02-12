class WorkedShift < ApplicationRecord
  belongs_to :user
  scope :by_date, ->(date) { where('date = ?', date) }
  scope :between_dates, ->(period) { where(date: period[:start]..period[:end]) }
end
