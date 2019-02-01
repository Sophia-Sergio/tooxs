# frozen_string_literal: true

module Api
  module V1
    # only statistics
    class StatisticsController < ApplicationController
      include FilterParameters
      before_action :set_store_department, :set_period

      def efficiency(params)
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

      def efficiency_summary(params)
        render json: StatsSummaryPresenter.new(@store_dep, @period).efficiency_statistics
      end

      def chart
        send(params[:type].to_sym, params)
      end

      def chart_period

      end

      def productivity(params)
        periodicity = graph_period(params)
      end

      def summary
        send("#{params[:type]}_summary".to_sym, params)
      end
    end
  end
end
