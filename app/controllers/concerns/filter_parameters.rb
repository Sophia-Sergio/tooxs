# frozen_string_literal: true

# Parameters used for demo only
module FilterParameters
  extend ActiveSupport::Concern

  def set_store_department
    @store_dep = StoreDepartment.find_by(
      store: params[:store], department: params[:department])
  end

  def set_store
    @store = Store.find(params[:store])
  end

  def set_period
    return unless params[:year_start].present? && params[:month_start].present?

    @period = Settings.month_period(params[:year_start], params[:month_start])
    return unless params[:year_end].present? && params[:month_end].present?

    @period = {
      start: @period[:start],
      end: Settings.month_period(params[:year_end], params[:month_end])[:end]
    }
  end

  def set_old_period
    return unless params[:year_start].present? && params[:month_start].present?
    return unless params[:year_end].present? && params[:month_end].present?

    @old_period = {
      start: Settings.month_period(params[:year_start].to_i - 1, params[:month_start])[:start],
      end: Settings.month_period(params[:year_end].to_i - 1 , params[:month_end])[:end]
    }
  end
end
