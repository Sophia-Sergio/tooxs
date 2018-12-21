class WorkedShift < ApplicationRecord
  belongs_to :user

  scope :by_date, ->(date) { where('date = ?', date) }
end