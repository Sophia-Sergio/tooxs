# frozen_string_literal: true

module Api
  module V1
    # only statistics
    class StatisticsController < ApplicationController
      include FilterParameters
      before_action :set_store_department, only: %i[graph]
      before_action :set_dates, only: %i[graph]

      def efficiency(params)
        rates = @store_dep.achievements.productivity_rate(@start, @end)
        data = rates.values.each_with_object([]) do |rate, array|
          array << rate.values.sum / Settings.periods_keys.count
        end
        render json: {
          labels: rates.keys.map { |date| "#{date.strftime('%d')}-#{date.strftime('%m')}" },
          datasets: [
            { label: 'Eficiencia Real', data: data },
            { label: 'Eficiencia Óptima', data: data }
          ]
        }
      end

      def graph
        send(params[:type].to_sym, params)
      end
    end
  end
end
