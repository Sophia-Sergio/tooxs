# frozen_string_literal: true

# Parameters used for demo only
module FilterParameters
  extend ActiveSupport::Concern
  include CommercialCalendar::Period

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def set_store_department
    if params.key?(:store) && params.key?(:department)
      return @store_dep = StoreDepartment.find_by(
        store: params[:store], department: params[:department])
    end

    @store_dep = current_user.store_department
  end

  def set_store
    @store ||= Store.find(params[:store])
  end

  def set_calendar_period
    @calendar_period = {
      start: Date.new(params[:year_start].to_i, params[:month_start].to_i, 1),
      end: Date.new(params[:year_start].to_i, params[:month_start].to_i, -1)
    }
    return unless params[:year_end].present? && params[:month_end].present?

    @calendar_period = {
      start: @calendar_period[:start],
      end: Date.new(params[:year_end].to_i, params[:month_end].to_i, -1)
    }
  end

  def set_period
    return unless params[:year_start].present? && params[:month_start].present?

    @period = month_period(params[:year_start], params[:month_start])
    return unless params[:year_end].present? && params[:month_end].present?

    @period = {
      start: @period[:start],
      end: month_period(params[:year_end], params[:month_end])[:end]
    }
  end

  def set_old_period
    return unless params[:year_start].present? && params[:month_start].present?
    return unless params[:year_end].present? && params[:month_end].present?

    @old_period = {
      start: month_period(params[:year_start].to_i - 1, params[:month_start])[:start],
      end: month_period(params[:year_end].to_i - 1 , params[:month_end])[:end]
    }
  end
end
