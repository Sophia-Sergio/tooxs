# frozen_string_literal: true

module Api
  module V1
    # only employees endpoints
    class EmployeesController < ApplicationController
      include FilterParameters
      before_action :set_store_department, :set_period
      skip_before_action :verify_authenticity_token

      def index
        employees = @store_dep.employees.working_on_period(@period)
        return unless employees.any?

        render json: EmployeesTablePresenter.new(employees, params).index
      end

      def sales_assistants
        sales_assistants = @store_dep.sales_assistants.working_on_period(@period)
        return unless sales_assistants.any?

        EmployeesTablePresenter.new(sales_assistants, params).sales_assistants
      end

      def sellers
        sellers = @store_dep.sellers.working_on_period(@period)
        return unless sellers.any?

        EmployeesTablePresenter.new(sellers, params).sellers(@store_dep, @period)
      end

      def staff
        sellers = @store_dep.sales_assistants.working_on_period(@period)
        array = (@period[:start]..@period[:end]).each_with_object([]) do |date, array|
          array << { date => sellers.employees_by_hour(date) }
        end
        render json: array
      end

      def table
        render json: {
          sellers: sellers || {},
          sales_assistants: sales_assistants || {}
        }.reject { |k,v| v.empty? }
      end
    end
  end
end
