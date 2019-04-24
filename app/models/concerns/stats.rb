module Stats
  extend ActiveSupport::Concern

  module Efficiency
    PERIODS_KEYS = Settings.productivity_periods_keys

    def abs_desviation(productivities, targets)
      PERIODS_KEYS.map do |period|
        (productivities[period] - targets[period]).abs if productivities[period] && targets[period]
      end.compact.sum
    end

    def day_efficiency(abs_desviation, target_day)
      ((1 - (abs_desviation / target_day.values.sum)) * 100).round(2)
    end

    def hours_deficit(productivities, targets)
      PERIODS_KEYS.map do |period|
        target = targets[period]
        prod = productivities[period]
        if prod && target
          target < prod ? (prod - target) / target : 0
        end
      end.compact.sum
    end

    def hours_excess(productivities, targets)
      PERIODS_KEYS.map do |period|
        target = targets[period]
        prod = productivities[period]
        if prod && target
          target > prod ? (target - prod) / target : 0
        end
      end.compact.sum
    end

    def hours_excess_and_deficit(productivities, targets)
      hours_excess(productivities, targets) + hours_deficit(productivities, targets)
    end
  end

  module Filter
    include ApplicationHelper

    FILTER_1_VIEWS = %w[dashboard sales employees staff optimizer staff_planning].freeze
    FILTER_2_VIEWS = %w[].freeze
    MONTH_PLUS_ONE_VIEWS = %w[optimizer hour_analysis].freeze

    def filter_1(view, date = Date.today)
      {
        years: years_filter(view),
        year: { value: default_year, label: default_year },
        month: { value: month_by_view(view), label: month_name(month_by_view(view)) },
        store: store.as_json(only: %i[id name]),
        worlds_departments: store.worlds.distinct.as_json(store.id),
        world_selected: store.bigger_plan_sale_world.as_json(store.id)
      }
    end

    def filter_by_view(view)
      filter_1(view) if FILTER_1_VIEWS.include? view
    end

    def years_filter(view, date = Date.today)
      actual_year = year_by_date(date)
      actual_month = month_by_view(view)
      ((actual_year - 1)..actual_year).each_with_object([]) do |year, array|
        months = year < actual_year ? (actual_month..12) : (1..actual_month)
        array << year_generator(year).merge(months: months_generator(months))
      end
    end

    def month_by_view(view, date = Date.today)
      MONTH_PLUS_ONE_VIEWS.include?(view) ? month_by_date(date) + 1 : month_by_date(date)
    end

    def months_generator(months)
      months.map { |month| { value: month, label: month_name(month) } }
    end

    def year_generator(year)
      { value: year, label: year }
    end

    def years_generator(years)
      years.map { |year| { value: year, label: year } }
    end
  end
end
