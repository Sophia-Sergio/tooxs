class TargetProductivity < ApplicationRecord
  belongs_to :store_department

  def self.by_date(date)
    find_by(Settings.config_date(date)).amount
  end
end
