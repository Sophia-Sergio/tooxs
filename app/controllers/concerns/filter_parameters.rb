# frozen_string_literal: true

# Parameters used for demo only
module FilterParameters
  extend ActiveSupport::Concern

  def set_stores
    @stores = Store.by_cluster(params[:cluster])
  end

  def set_store_department
    @store_dep = StoreDepartment.find_by(
      store: params[:store], department: params[:department])
  end

  def set_dates
    @start = Settings.month_start(params[:year_start], params[:month_start])
    @end = Settings.month_end(params[:year_end] || params[:year_start],
                              params[:month_end] || params[:month_start])
  end
end
