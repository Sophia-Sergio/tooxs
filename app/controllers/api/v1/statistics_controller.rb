# frozen_string_literal: true

module Api
  module V1
    # only statistics
    class StatisticsController < ApplicationController
      include FilterParameters
      extend CommercialCalendar::Period

      before_action :set_store_department, :set_period
      before_action :set_old_period, only: [:chart]

      def months_difference(date_start, date_end)
        year_start  = year_by_date(date_start)
        month_start = month_by_date(date_start)
        year_end    = year_by_date(date_end)
        month_end   = month_by_date(date_end)
        month_count = year_start == year_end ? month_end - month_start : 12 - month_start + month_end
        year_start == year_end ? month_count + 1 : (year_end - year_start - 1 ) * 12 + month_count + 1
      end

      def efficiency
        real = @store_dep.efficiency_by_date
        optimized = real.values.map { |value| value * rand(1.2..1.4)  }
        render json: {
          labels: real.keys.map { |date| "#{date.strftime('%d')}-#{date.strftime('%m')}" },
          datasets: [
            { label: 'Eficiencia Real', data: real.values },
            { label: 'Eficiencia Óptima', data: optimized }
          ]
        }
      end

      def efficiency_summary
        render json: StatsSummaryPresenter.new(@store_dep, @period).efficiency_statistics
      end

      def chart
        send(params[:type].to_sym)
      end

      def chart_period
        difference_in_months = months_difference(@period[:start], @period[:end])
        return 'daily' if difference_in_months == 1
        return 'weekly' if difference_in_months >= 2 && difference_in_months <= 7

        'monthly'
      end

      def productivity
        productivity = @store_dep.productivity_by_date(@period)
        render json: {
          labels: dates_peridiocity(productivity.keys, chart_period),
        }
      end

      def sales
        sales = @store_dep.categories_sales_by_dates(@period)
        sales_last_year = @store_dep.categories_sales_by_dates(@old_period)
        categories_plan_sales_by_dates =  @store_dep.categories_plan_sales_by_dates(@period)
        render json: {
          labels: dates_peridiocity(sales.keys, chart_period),
          datasets: [
            { label: 'Real', data: values_peridiocity(sales, chart_period) },
            { label: 'Histórico', data: values_peridiocity(sales_last_year, chart_period) },
            { label: 'Plan', data: values_peridiocity(categories_plan_sales_by_dates, chart_period) }
          ]
        }
      end

      def compared_stores
        sales = @store_dep.categories_sales_by_dates(@period)
        store_compared = StoreDepartment.find_by(store_id: params[:store_compared], department_id: params[:department])
        comparative_sales = store_compared.categories_sales_by_dates(@period)
        render json: {
          labels: dates_peridiocity(sales.keys, chart_period),
          datasets: [
            { label: @store_dep.store.name, data: values_peridiocity(sales, chart_period)},
            { label: store_compared.store.name, data: values_peridiocity(comparative_sales, chart_period)},
          ]
        }
      end

      def dates_peridiocity(dates, periodicity)
        case periodicity
        when 'daily'
          dates
        when 'weekly'
          dates.each_with_index.map { |_, i| x if ((i + 1) % 7).zero? }.compact
        when 'monthly'
          dates.map { |date| year_month_by_date(date) }.uniq
        end
      end

      def values_peridiocity(data, periodicity)
        case periodicity
        when 'daily'
          data.values
        when 'weekly'
          times = data.values.length / 7
          (1..times).each_with_object([]) { |d, array| array << data.values.shift(7).sum }
        when 'monthly'
          date_start = data.keys.first
          date_end = data.keys.last
          (date_start..date_end).each_with_object({}) do |date, hash|
            (hash[year_month_by_date(date)] ||= []) << data[date]
          end.values.map(&:sum)
        end
      end

      def summary
        send("#{params[:type]}_summary".to_sym)
      end
    end
  end
end
