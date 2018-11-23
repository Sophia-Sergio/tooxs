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

  def set_store
    @store = Store.find(params[:store])
  end

  def set_department
    @department = @store.departments.find(params[:department])
  end

  def filter_params
    params.permit(:year, :month, :store, :department, :encrypted_password)
  end

  def set_stores
    @stores = Store.by_cluster(params[:cluster])
  end
end
