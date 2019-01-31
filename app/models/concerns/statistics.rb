module Statistics
  module Efficiency
    extend ActiveSupport::Concern
    def abs_desviation(productivities, targets)
      productivities.zip(targets).map do |prod_target|
        (prod_target[1] - prod_target[0]).abs
      end.sum
    end

    def hours_excess(productivities, targets)
      productivities.zip(targets).map do |prod_target|
        prod_target[1] > prod_target[0]? (prod_target[0] - prod_target[1]) / prod_target[1] : 0
      end.sum
    end

    def hours_deficit(productivities, targets)
      productivities.zip(targets).map do |prod_target|
        prod_target[1] < prod_target[0]? (prod_target[0] - prod_target[1]) / prod_target[1] : 0
      end.sum
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
