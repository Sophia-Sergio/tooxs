class Achievement < ApplicationRecord
  before_save :set_total_day
  belongs_to :store_department
  belongs_to :store
  belongs_to :user

  scope :between, ->(start_date, end_date) { where('date between ? AND ?', start_date, end_date) }
  scope :by_date, ->(date) { where(date: date) }

  def set_total_day
    self.total_day = achievement.values.map(&:to_f).sum.round(2)
  end

  def self.sum_by_hour
    array = []
    all.each do |achievement|
      values = achievement.achievement.values.map(&:to_i)
      array = array.any? ? array.zip(values).map { |a| a.inject(:+) } : values
    end
    Settings.periods_keys.zip(array).to_h
  end

  def self.total_by_user_id
    group('users.id').sum('achievements.total_day')
  end
end