class EfficiencyController < ApplicationController
	def index	
		@stores       = Store.all.order(:id)
		@departments  = Department.all.order(:id)
		@search = ""
		@month = params[:month] || timeNow.strftime("%m").to_i
	end

	def report
		excesoReal = matrix_calc(@prod_obj, @totalMonth, dotReal)
		totalHour = (@realMonth.sum / @prod_obj)
		@margin_adjustment = (1 - ((excesoReal[:exceso] + excesoReal[:faltante]) / totalHour)).round(4) * 100 
	end
end
