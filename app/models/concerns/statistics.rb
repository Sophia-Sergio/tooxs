module Statistics
  module Efficiency
    PERIODS_KEYS = Settings.periods_keys
    extend ActiveSupport::Concern

    def abs_desviation(productivities, targets)
      PERIODS_KEYS.map do |period|
        (productivities[period] - targets[period]).abs if productivities[period] && targets[period]
      end.compact.sum
    end

    def day_efficiency(abs_desviation, target_day)
      ((1 - (abs_desviation / target_day.values.sum)) * 100).round(2)
    end

    def hours_excess(productivities, targets)
      PERIODS_KEYS.map do |period|
        if productivities[period] && targets[period]
          targets[period] < productivities[period] ? productivities[period] - targets[period]: 0
        end
      end.compact.sum
    end

    def hours_deficit(productivities, targets)
      PERIODS_KEYS.map do |period|
        if productivities[period] && targets[period]
          targets[period] > productivities[period] ? targets[period] - productivities[period] : 0
        end
      end.compact.sum
    end
  end

  module Filters
    def years_filter(date = Date.today)
      actual_year = year_by_date(date)
      actual_month = month_by_date(date)
      ((actual_year - 1)..actual_year).each_with_object([]) do |year, array|
        months = year < actual_year ? (actual_month..12) : (1..actual_month)
        array << {
          value: year, label: year,
          months: months.map { |m| { value: m, label: Settings.month_name[m] } }
        }
      end
    end
  end
end
