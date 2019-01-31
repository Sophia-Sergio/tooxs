# frozen_string_literal: true

module Api
  module V1
    # only employees endpoints
    class EmployeesController < ApplicationController
      include FilterParameters
      before_action :set_store_department, :set_period
      skip_before_action :verify_authenticity_token

      def sales_assistants_table
        return nil unless @store_dep.sellers.any?

        @store_dep.sales_asisstants.as_json(only: [:id, :name, :surname_1])
      end

      def sellers_table
        return nil unless @store_dep.sellers.any?

        sellers = @store_dep.sellers.working_on_period(@period)
        achievements = sellers.total_achievements(@period)
        plan_hours = sellers.plan_hours(params[:year_start], params[:month_start])
        goals = goals(plan_hours, params[:year_start], params[:month_start])
        shifts = User.sellers.where(id: sellers.ids).shifts_ids(params[:year_start], params[:month_start])

        data_table = sellers.each_with_object([]) do |seller, array|
          array << {
            id: seller.id,
            name: seller.name,
            surname_1: seller.surname_1,
            avatar: '',
            shifts: shifts[seller.id].uniq,
            sell: achievements[seller.id],
            goal: goals[seller.id],
            objective: (achievements[seller.id] / goals[seller.id]).round(2),
            link: seller_path(seller)
          }
        end
      end

      "hola":{
        "first":
          {
            "name":"CUMPLIMIENTO DE EFICIENCIA",
            "value":32.08857142857143,
            "description":"Eficiencia Objetivo 75%"},
        "second":
          {
            "name":"CUMPLIMIENTO PLAN DE VENTA",
            "value":null,
            "description":"Plan $9725163280.0. Real $347327260.0"
          },
        "third":
          144603.29719858157}


      def goals(plan_hours, year, month)
        periods = TargetProductivity.periods.keys
        productivities = @store_dep.target_productivities.
          where(year: 2018, month: 7).by_week_period
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
