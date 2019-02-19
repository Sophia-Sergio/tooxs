class TargetProductivity < ApplicationRecord
  extend CommercialCalendar::Period

  WEEK_PERIODS = Settings.productivity_week_periods_keys

  belongs_to :store_department

  enum period: {
    monday_friday_am: 1,
    monday_friday_pm: 2,
    saturday_sunday_am: 3,
    saturday_sunday_pm: 4
  }

  scope :between_dates, ->(period) { BetweenDatesWithoutDateAttributeQuery.new(self, period).call }

  def self.by_date(date)
    find_by(config_date(date).except(:day)).amount
  end

  # recieves target_productivities by year nd month
  def self.by_week_period
    all.pluck(:week, :period, :amount).each_with_object({}) do |array, hash|
      hash[array[0]] ||= {}
      hash[array[0]][array[1]] = array[2]
    end
  end

  def self.by_date_hour(period)
    hash = between_dates(period).order(:year, :month, :week).uniq.each_with_object({}) do |prod, h|
      week_period = week_period(prod.year, prod.month, prod.week)
      (week_period[:start]..week_period[:end]).each do |date|
        next unless date_period(date, prod.period)

        (h[date] ||= []) << WEEK_PERIODS[prod.period].map { |k| [k => prod.amount] }
      end
    end
    hash = hash.extract!(*(period[:start]..period[:end]))
    hash.keys.each_with_object({}) { |k, h| h[k] = hash[k].flatten.reduce(:merge) }
  end

  def self.date_period(date, period)
    ((1..5).to_a.include?(date.wday) && periods.keys[0..1].include?(period)) ||
      ([6, 0].include?(date.wday) && periods.keys[2..3].include?(period))
  end
end
