# frozen_string_literal: true

module Api
  module V1
    # only employees endpoints
    class EmployeesController < ApplicationController
      include FilterParameters
      before_action :set_store_department, only: %i[sellers_table]
      before_action :set_dates, only: %i[sellers_table]
      skip_before_action :verify_authenticity_token

      def sellers_table
        sellers = @store_dep.sellers.working_on_period(@start, @end)
        achievements = sellers.total_achievements(@start, @end)
        plan_hours = sellers.plan_hours(params[:year_start], params[:month_start])
        goals = goals(plan_hours, params[:year_start], params[:month_start])
        shifts = Seller.where(id: sellers.ids).shifts_ids(params[:year_start], params[:month_start])

        sellers_table = sellers.each_with_object([]) do |seller, array|
          array << {
            id: seller.id,
            name: seller.name,
            avatar: '',
            shifts: shifts[seller.id].join(','),
            sell: achievements[seller.id],
            goal: goals[seller.id],
            objective: (achievements[seller.id] / goals[seller.id]).round(2),
            link: seller_path(seller)
          }
        end
        render json: sellers_table
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
    end
  end
end
