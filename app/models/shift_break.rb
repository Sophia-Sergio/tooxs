class ShiftBreak < ApplicationRecord
  belongs_to :employee, foreign_key: 'user_id'
  enum reason: {
    lunch: 1,
    break: 2,
    other: 3
  }

  scope :date, ->(date) { where(date: date) }

  def self.break_times
    all.each_with_object({}) do |shift_break, hash|
      break_time = shift_break.break_time
      break_time.keys.each do |hours|
        hash[hours] = break_time[hours]
      end
    end
  end

  def break_time
    hours = (check_in - check_out) / 3600
    (check_in.hour..check_out.hour).each_with_index.each_with_object({}) do |(hour, index), hash|
      hour_worked = (checkin - checkin.beginning_of_hour) / 3600 if index.zero? && hours > 1
      hour_worked = 0.0 if hours >= 1 && !index.zero?
      hour_worked = (check_out - check_out.beginning_of_hour) / 3600 if hours < 1
      hash["#{hour} - #{hour + 1}"] = hour_worked
      hours -= 1
    end
  end
end
