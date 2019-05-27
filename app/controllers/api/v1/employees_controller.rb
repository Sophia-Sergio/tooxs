# frozen_string_literal: true

module Api
  module V1
    # only employees endpoints
    class EmployeesController < ApplicationController
      protect_from_forgery except: :chart if ENV['DIS_CSRF'] == 'OK'
      skip_before_action :authenticate_user!, :set_current_user_store_department if ENV['DIS_CSRF'] == 'OK'

      include FilterParameters
      before_action :set_store_department, :set_period
      before_action :set_employee, only: %i[calendar_shift achievements_chart]
      before_action :set_calendar_period, only: %i[calendar_shift achievements_chart table]
      skip_before_action :verify_authenticity_token

      def calendar_shift
        render json: @employee.calendar_shift(@calendar_period).to_a
      end

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

        Rails.cache.fetch("/employees/table/#{@store_dep.id}/#{@period}") do
          EmployeesTablePresenter.new(sellers, params).sellers(@period)
        end
      end

      def staff
        employees = @store_dep.employees.working_on_period(@period)
        employees = (@period[:start]..@period[:end]).each_with_object([]) do |date, array|
          shifts = { shifts: employees.employees_by_hour(date) }
          array << { date: date }.merge(shifts)
        end
        render json: employees
      end

      def achievements_chart
        achievements = @employee.achievements.between(@period)
        target_achievements = @employee.target_achievements(@period)
        render json: {
          labels: target_achievements.keys,
          datasets: [
            { label: 'Real', data: achievements.pluck(:total_day) },
            { label: 'Plan', data: target_achievements.values }
          ]
        }
      end

      def table
        render json: {
          sellers: sellers || {},
          sales_assistants: sales_assistants || {}
        }.reject { |_, v| v.empty? }
      end
    end
  end
end
