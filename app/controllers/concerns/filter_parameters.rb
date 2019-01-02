# frozen_string_literal: true

# Parameters used for demo only
module FilterParameters
  extend ActiveSupport::Concern

  def demo_data
    {
      department: 1,
      store: 1,
      search: '',
      date: Date.new(2018, 6, 24),
      cluster: 1,
      month: 6,
      year: 2018,
      target_productivity: 85000,
    }
  end

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
    @store_dep = StoreDepartment.find_by(store: Store.find(params[:store], department: Department.find(params[:department])))
  end
end
