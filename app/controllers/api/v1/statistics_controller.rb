# frozen_string_literal: true

module Api
  module V1
    # only statistics
    class StatisticsController < ApplicationController
      include FilterParameters
      include CommercialCalendar::Period
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
          ChartSummaryPresenter.new(@store_dep, @period).efficiency
        end
        render json: json
      end

      def hour_analysis
        render json: HourAnalysisStatsPresenter.new(@store_dep, @period).call(hour_analysis_data, @label_period)
      end

      def hour_analysis_data
        real_or_planned_data = real_or_planned_data_for_hour_analysis[:data]
        real_or_planned_label = real_or_planned_data_for_hour_analysis[:label]
        {
          real_or_planned: { label: real_or_planned_label, data: real_or_planned_data },
          planned_hours: @store_dep.hourly_planned_staff_by_date(@period),
          planned_productivity: @store_dep.no_optimized_productivity_by_date(@period)
        }
      end

      def productivity
        json = Rails.cache.fetch("/productivity/data_view/#{@store_dep.id}/#{@period}") do
          ProductivityStatsPresenter.new(@store_dep, @period).call(productivity_data, @label_period)
        end
        render json: json
      end

      def productivity_data
        {
          no_optimized: @store_dep.productivity_by_date(@full_period),
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

      private

      def real_or_planned_data_for_hour_analysis
        if month_before_or_equal_to_actual_month?(params[:year_start], params[:month_start])
          { data: @store_dep.hour_analysis_by_date(@period), label: 'Real' }
        else
          { data: @store_dep.plan_hour_analysis_by_date(@period), label: 'Plan' }
        end
      end
    end
  end
end
