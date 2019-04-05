class OptimizedProductivity < ApplicationRecord
  belongs_to :store_department
  scope :between, ->(period) { where('date between ? AND ?', period[:start], period[:end]) }

  def avg_day
    hourly.values.map(&:to_i).sum / hourly.values.size
  end

  def self.by_date_hour(period)
    all.between(period).each_with_object({}) do |optimized_productivity, hash|
      hash[optimized_productivity.date] = optimized_productivity.avg_day
    end
  end
end
