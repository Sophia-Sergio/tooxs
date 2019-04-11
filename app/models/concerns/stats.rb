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

  module Filter
    include ApplicationHelper

    FILTER_1_VIEWS = %w[dashboard sales].freeze
    FILTER_2_VIEWS = %w[optimizer].freeze

    def filter_1(date = Date.today)
      {
        years: years_filter,
        year: { value: default_year, label: default_year },
        month: { value: month_by_date(date), label: month_name(month_by_date(date)) },
        store: store.as_json(only: %i[id name]),
        worlds_departments: store.worlds.distinct.as_json(store.id),
        world_selected: store.bigger_plan_sale_world.as_json(store.id)
      }
    end

    def filter_2(date = Date.today)
      actual_month = month_by_date(date)
      actual_year = year_by_date(date)
      {
        years: years_generator(actual_year..actual_year),
        year: { value: default_year, label: default_year },
        months: months_generator(((actual_month + 1)..12)),
        month: { value: actual_month + 1, label: month_name(actual_month + 1) },
        store: store.as_json(only: %i[id name]),
        worlds_departments: store.worlds.distinct.as_json(store.id),
        world_selected: store.bigger_plan_sale_world.as_json(store.id)
      }
    end

    def filter_by_view(view)
      return filter_1 if FILTER_1_VIEWS.include? view

      filter_2 if FILTER_2_VIEWS.include? view
    end

    def years_filter(date = Date.today)
      actual_year = year_by_date(date)
      actual_month = month_by_date(date)
      ((actual_year - 1)..actual_year).each_with_object([]) do |year, array|
        months = year < actual_year ? (actual_month..12) : (1..actual_month)
        array << year_generator(year).merge(months: months_generator(months))
      end
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
