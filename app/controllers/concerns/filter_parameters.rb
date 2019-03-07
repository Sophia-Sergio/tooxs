# frozen_string_literal: true

# Parameters used for demo only
module FilterParameters
  extend ActiveSupport::Concern
  include CommercialCalendar::Period

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def set_label_period
    return unless params[:year_start].present? && params[:month_start].present?

    start_period = month_period(params[:year_start], params[:month_start])
    @label_period = (start_period[:start]..start_period[:end]).map do |date|
      "#{date.strftime('%d')}-#{date.strftime('%m')}"
    end

    return unless params[:year_end].present? && params[:month_end].present?

    end_period = month_period(params[:year_end], params[:month_end])
    @label_period = (start_period[:start]..end_period[:end]).map do |date|
      "#{date.strftime('%d')}-#{date.strftime('%m')}"
    end
  end

  def set_demo_efficiency_optimized
    @efficiency_optimized = [98.44, 87.72, 83.53, 79.76, 87.36, 96.25, 67.74,
                             83.55, 84.81, 78.57, 94.52, 97.44, 82.02, 90.67,
                             92.54, 96.87, 81.93, 94.44, 82.35, 89.58, 97.72,
                             92.86, 93.55, 90.78, 93.85, 98.7, 86.02, 86.67]
    if Settings.weeks_by_month[params[:month_start].to_i] == 5
      @efficiency_optimized += [83.55, 84.81, 78.57, 94.52, 97.44, 82.02, 90.67]
    end
  end

  def set_store_department
    if params.key?(:store) && params.key?(:department)
      return @store_dep = Store.find(params[:store]) if params[:department].to_i == 999

      return @store_dep = StoreDepartment.find_by(
        store: params[:store], department: params[:department]
      )
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
    if params[:month_start].to_i == month_by_date(Date.today)
      @period = { start: @period[:start], end: Date.today }
    end

    return unless params[:year_end].present? && params[:month_end].present?

    @full_period = {
      start: @period[:start],
      end: month_period(params[:year_end], params[:month_end])[:end]
    }
    if params[:month_end].to_i == month_by_date(Date.today)
      @period = { start: @period[:start], end: Date.today }
    end
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
