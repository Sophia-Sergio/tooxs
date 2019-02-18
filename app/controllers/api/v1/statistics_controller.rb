# frozen_string_literal: true

module Api
  module V1
    # only statistics
    class StatisticsController < ApplicationController
      include FilterParameters
      before_action :set_store_department, :set_period
      before_action :set_old_period, only: [:chart]

      def chart
        send(params[:type].to_sym)
      end

      def compared_stores_data
        compared_stores = StoreDepartment.where(
          store_id: params[:compared_stores],
          department_id: params[:department]
        )
        {
          actual_store_sales: @store_dep.categories_sales_by_dates(@period),
          compared_stores: compared_stores.each_with_object([]) do |store_dep, array|
            array << {
              name: store_dep.store.name,
              sales: store_dep.categories_sales_by_dates(@period)
            }
          end
        }
      end

      def compared_sales
        render json: {
          chart: StatsPresenter.new(@store_dep, @period).compared_sales_chart(compared_stores_data),
          summary: StatsPresenter.new(@store_dep, @period).compared_sales_summary(compared_stores_data)
        }
      end

      def efficiency
        real = @store_dep.efficiency_by_date(@period)
        optimized = real.values.map { |value| value * rand(1.2..1.4) }
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

      def productivity
        productivity = @store_dep.productivity_by_date(@period)
        render json: {
          labels: dates_peridiocity(productivity.keys, chart_period)
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

      def summary
        send("#{params[:type]}_summary".to_sym)
      end
    end
  end
end
