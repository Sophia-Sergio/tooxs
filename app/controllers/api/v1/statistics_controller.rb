# frozen_string_literal: true

module Api
  module V1
    # only statistics
    class StatisticsController < ApplicationController
      include FilterParameters
      extend CommercialCalendar::Period

      before_action :set_store_department, :set_period
      before_action :set_old_period, only: [:chart]

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
        render json: StatsPresenter.new(@store_dep, @period).efficiency_chart
      end

      def chart
        send(params[:type].to_sym)
      end


      def productivity
        productivity = @store_dep.productivity_by_date(@period)
        render json: {
          labels: dates_peridiocity(productivity.keys, chart_period),
        }
      end

      def sales
        render json: {
          chart: StatsPresenter.new(@store_dep, @period).sales_chart(sales_data),
          summary: StatsPresenter.new(@store_dep, @period).sales_summary(sales_data)
        }
      end

      def sales_data
        {
          sales: @store_dep.categories_sales_by_dates(@period),
          last_year_sales: @store_dep.categories_sales_by_dates(@old_period),
          categories_plan_sales_by_dates: @store_dep.categories_plan_sales_by_dates(@period)
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

      def summary
        send("#{params[:type]}_summary".to_sym)
      end
    end
  end
end
