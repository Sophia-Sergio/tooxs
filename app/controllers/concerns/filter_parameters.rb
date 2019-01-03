# frozen_string_literal: true

# Parameters used for demo only
module FilterParameters
  extend ActiveSupport::Concern

  def set_params
    @month  = params[:month] ||= demo_data[:month]
    @year   = params[:year] ||= demo_data[:year]
    params[:department] ||= demo_data[:department]
    params[:store] ||= demo_data[:store]
  end

  def set_stores
    @stores = Store.by_cluster(params[:cluster])
  end

  def set_store_department
    @store_dep = StoreDepartment.find_by(store: params[:store], department: params[:department])
  end
end
