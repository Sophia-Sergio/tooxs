# frozen_string_literal: true

module Api
  module V1
    # only employees endpoints
    class EmployeesController < ApplicationController
      include FilterParameters
      before_action :set_store_department, :set_period
      skip_before_action :verify_authenticity_token

      def sales_assistants_table
        sales_assistants = @store_dep.sales_assistants.working_on_period(@period)
        return unless sales_assistants.any?

        shifts = User.sales_assistants.
          where(id: sales_assistants.ids).shifts_ids(params[:year_start], params[:month_start])
        sales_assistants.as_json.each do |sale_assistant|
          sale_assistant[:shifts] = shifts[sale_assistant["id"]].uniq
        end
      end

      def sellers_table
        sellers = @store_dep.sellers.working_on_period(@period)
        return unless sellers.any?

        achievements = sellers.total_achievements(@period)
        plan_hours = sellers.plan_hours(params[:year_start], params[:month_start])
        goals = goals(plan_hours, params[:year_start], params[:month_start])
        shifts = User.sellers.where(id: sellers.ids).
          shifts_ids(params[:year_start], params[:month_start])
        sellers.as_json.each do |seller|
          seller[:shifts] = shifts[seller["id"]].uniq
          seller[:sell] = achievements[seller["id"]].round
          seller[:goal] = goals[seller["id"]]
          seller[:objective] = (achievements[seller["id"]] / goals[seller["id"]]).round(2)
          seller[:link] = employee_path(seller["id"])
        end
      end

      def goals(plan_hours, year, month)
        periods = TargetProductivity.periods.keys
        productivities = @store_dep.target_productivities.
          where(year: year, month: month).by_week_period
        productivities.each_with_object({}) do |(week, value), goals|
          plan_hours[week].each do |seller|
            goals[seller.id] ||= 0
            goals[seller.id] += periods.map { |p| seller[p] * value[p] }.sum
          end
        end
      end

      def table
        render json: {
          sellers: sellers_table || {},
          sales_assistants: sales_assistants_table || {}
        }.reject { |k,v| v.empty? }
      end
    end
  end
end
