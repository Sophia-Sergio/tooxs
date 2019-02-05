module Statistics
  module Efficiency
    extend ActiveSupport::Concern
    def abs_desviation(productivities, targets)
      Settings.periods_keys.map do |period|
        (productivities[period] - targets[period]).abs if productivities[period] && targets[period]
      end.compact.sum
    end

    def day_efficiency(abs_desviation, target_day)
      ((1 - (abs_desviation / target_day.values.sum)) * 100).round(2)
    end

    def hours_excess(productivities, targets)
      Settings.periods_keys.map do |period|
        if productivities[period] && targets[period]
          targets[period] < productivities[period] ? productivities[period] - targets[period]: 0
        end
      end.compact.sum
    end

    def hours_deficit(productivities, targets)
      Settings.periods_keys.map do |period|
        if productivities[period] && targets[period]
          targets[period] > productivities[period] ? targets[period] - productivities[period] : 0
        end
      end.compact.sum
    end
  end

  module Defaults
    extend ActiveSupport::Concern
    def default_period
      year = Settings.year_by_date(Date.today)
      month = Settings.month_by_date(Date.today)
      Settings.month_period(year, month)
    end

    def default_year_month
      { year: Settings.year_by_date(Date.today), month: Settings.month_by_date(Date.today) }
    end

    def default_month
      Settings.month_by_date(Date.today)
    end
  end

  module Filters
    def years_filter
      actual_year = Settings.year_by_date(Date.today)
      actual_month = Settings.month_by_date(Date.today)
      hash = ((actual_year-1)..actual_year).each_with_object([]) do |year, array|
        months = year < actual_year ? (actual_month..12) : (1..actual_month)
        array << {
          value: year, label: year ,
          months: months.map { |m| { value: m, label: Settings.month_name[m] } }
        }
      end
    end
  end
end
