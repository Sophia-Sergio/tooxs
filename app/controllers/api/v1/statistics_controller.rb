# frozen_string_literal: true

module Api
  module V1
    # only statistics
    class StatisticsController < ApplicationController
      def efficiency(params)
        rates = Achievement.productivity_rate(dates(params)[:start], dates(params)[:end])
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

      def dates(params)
        {
          start: Settings.month_start(params[:year_start], params[:month_start]),
          end: Settings.month_end(params[:year_end], params[:month_end])
        }
      end

      def graph
        send(params[:type].to_sym, params)
      end
    end
  end
end
