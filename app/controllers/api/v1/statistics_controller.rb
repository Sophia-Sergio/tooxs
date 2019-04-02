# frozen_string_literal: true

module Api
  module V1
    # only statistics
    class StatisticsController < ApplicationController
      include FilterParameters
      before_action :set_store_department, :set_period, :set_label_period, :set_demo_efficiency_optimized
      before_action :set_old_period, only: %i[chart]

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
          chart: SalesStatsPresenter.new(@store_dep, @period).
            compared_stores_chart(compared_stores_data, @label_period),
          summary: SalesStatsPresenter.new(@store_dep, @period).
            compared_stores_summary(compared_stores_data, @full_period)
        }
      end

      def efficiency
        real = Rails.cache.fetch("/efficiency/chart/#{@store_dep.id}/#{@period}") do
          @store_dep.efficiency_by_date(@period)
        end
        optimized = @efficiency_optimized

        render json: {
          labels: @label_period,
          datasets: [
            { label: 'Eficiencia Real', data: real.values },
            { label: 'Eficiencia Óptima', data: optimized }
          ]
        }
      end

      def efficiency_summary
        json = Rails.cache.fetch("/efficiency/summary/#{@store_dep.id}/#{@period}") do
          ChartSummaryPresenter.new(@store_dep, @period).chart
        end
        render json: json
      end

      def productivity
        # json = Rails.cache.fetch("/productivity/#{@store_dep.id}/#{@period}") do
        json = ProductivityStatsPresenter.new(@store_dep, @period).chart(productivity_data)
        # end
        render json: { chart: json }
      end

      def productivity_data
        {
          real: @store_dep.productivity_by_date(@period),
          target: @store_dep.target_productivity_by_date(@full_period),
          optimized: @store_dep.optimized_productivity_by_date(@full_period)
        }
      end

      def sales
        render json: {
          chart: SalesStatsPresenter.new(@store_dep, @full_period).chart(sales_data, @label_period),
          summary: SalesStatsPresenter.new(@store_dep, @full_period).summary(sales_data)
        }
      end

      def sales_data
        {
          sales: @store_dep.categories_sales_by_dates(@period),
          last_year_sales: @store_dep.categories_sales_by_dates(@old_period),
          categories_plan_sales_by_dates: @store_dep.categories_sales_plan_by_dates(@full_period)
        }
      end

      def summary
        send("#{params[:type]}_summary".to_sym)
      end
    end
  end
end
