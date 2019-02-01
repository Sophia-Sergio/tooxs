# frozen_string_literal: true

module Api
  module V1
    # only statistics
    class PeriodsController < ApplicationController
      def month_period
        render json: Settings.month_period(params[:year], params[:month])
      end
    end
  end
end