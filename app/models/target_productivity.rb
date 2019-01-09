class TargetProductivity < ApplicationRecord
  belongs_to :store_department
  enum period: {
    monday_friday_am: 1,
    monday_friday_pm: 2,
    saturday_sunday_am: 3,
    saturday_sunday_pm: 4
  }

  def self.by_date(date)
    find_by(Settings.config_date(date)).amount
  end

  # recieves target_productivities by year nd month
  def self.by_week_period
    all.pluck(:week, :period, :amount).each_with_object({}) do |array, hash|
      hash[array[0]] ||= {}
      hash[array[0]][array[1]] = array[2]
    end
  end
end
