class DataMasterController < ApplicationController
	def index
		add_breadcrumb "Dashboard", :root_path
    	add_breadcrumb "Maestro de datos", :data_master_index_path
		@month = Date.today.strftime("%m").to_i
		@data_case = DataCase.where(month: @month).first
	end
end
