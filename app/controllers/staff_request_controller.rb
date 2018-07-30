class StaffRequestController < ApplicationController
  def index

    if params[:month] == nil
      params[:year]  = Date.today.strftime("%Y")
      params[:month] = Date.today.strftime("%m")
      params[:department] = 1
      params[:store] = 1
    end
  
    @month = params[:month].to_i
    @year = params[:year].to_i
    @store = params[:department].to_i
    @dep = params[:store].to_i

    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Dotación personal", :staffing_index_path
  	@search       = ''
    @stores       = Store.all.order(:id)
    @departments  = Department.all.order(:id)
  end
end
