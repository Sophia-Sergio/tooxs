# frozen_string_literal: true

module Api
  module V1
    # only statistics
    class PeriodsController < ApplicationController
      include FilterParameters
      before_action :set_period, only: %i[filter_period]

      def filter_period
        render json: @period
      end
    end
  end
end