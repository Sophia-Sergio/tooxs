class TargetProductivity < ApplicationRecord
  belongs_to :store_department
  enum period: {
    monday_friday_am: 1,
    monday_friday_pm: 2,
    saturday_sunday_am: 3,
    saturday_sunday_pm: 4
  }

  scope :between_dates, ->(start_date, end_date) {
    if start_date.year == end_date.year
      where('year = ? AND month >= ? AND month <= ?',
        start_date.year, start_date.month, end_date.month)
    else
      where('year = ? AND month >= ?', start_date.year, start_date.month).
      or(where('year = ? AND month <= ?', end_date.year, end_date.month))
    end
  }

  def self.by_date(date)
    find_by(Settings.config_date(date).except(:day)).amount
  end

  # recieves target_productivities by year nd month
  def self.by_week_period
    all.pluck(:week, :period, :amount).each_with_object({}) do |array, hash|
      hash[array[0]] ||= {}
      hash[array[0]][array[1]] = array[2]
    end
  end

  def self.by_date_hour(period)
    hash = between_dates(period[:start], period[:end]).
      order(:year, :month, :week).uniq.each_with_object({}) do |prod, h|
        week_period = Settings.week_period(prod.year, prod.month, prod.week)
        (week_period[:start]..week_period[:end]).each do |date|
          next unless date_period(date, prod.period)

          (h[date] ||= []) << Settings.week_periods_keys[prod.period].map { |k| [k => prod.amount] }
        end
      end
    hash = hash.extract!(*(period[:start]..period[:end]))
    hash.keys.each_with_object({}) { |k, h| h[k] = hash[k].flatten.reduce(:merge) }
  end

  def self.date_period(date, period)
    ((1..5).to_a.include?(date.wday) && self.periods.keys[0..1].include?(period)) ||
    ([6,0].include?(date.wday) && self.periods.keys[2..3].include?(period))
  end
end
