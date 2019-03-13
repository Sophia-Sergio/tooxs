# frozen_string_literal: true

module Api
  module V1
    # only statistics
    class ShiftsController < ApplicationController
      include FilterParameters
      before_action :set_store_department, :set_period

      def employees_calendar_shifts
        employees = @store_dep.employees.working_on_period(@full_period)
        employees_shifts = employees.each_with_object([]) do |employee, array|
          array << {
            user_id: employee.id,
            fixed: employee.fixed_shift,
            shift: { id: employee.work_shift.id, name: employee.work_shift.name },
            calendar_shifts: employee.calendar_shift(@full_period)
          }
        end
        render json: employees_shifts
      end

      def all
        shifts = WorkShift.all.each_with_object([]) do |shift, array|
          array << {
            id: shift.id,
            name: shift.name,
            calendar_shifts: shift.plan_shifts.order(:week, :day).
              as_json(only: %i[week day], methods: %i[working_period])
          }
        end
        render json: shifts
      end
    end
  end
end
