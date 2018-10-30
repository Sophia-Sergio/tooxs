class SalesStatisticsController < ApplicationController
	def show
	    add_breadcrumb "Dashboard", :root_path
	    add_breadcrumb "Reporte de venta", :sales_statistic_path
		@search = ''
    	@stores       = Store.all.order(:id)
    	@departments  = Department.all.order(:id)
		@controller = 'Venta Mensual'

		@stores     = Store.all.order(:id)
		@departments = Department.all.order(:id)

		@search = ''
		@compare = 'compare'

		@store  = Store.find(1)
		@dep    = Department.find(1)

		@year  = Date.today.strftime("%Y").to_i
		@month = Date.today.strftime("%m").to_i

		beginning_of_month = "#{@year}-#{@month}-01".to_date
		end_of_month = beginning_of_month.end_of_month

		week_start = beginning_of_month.strftime("%V")
		week_end   = end_of_month.strftime("%V")

		#week fix if is last week of the year on first month
		week_start = '01' if week_start.to_i == 53

		# @historic_sale  = Hs.where(year: @year - 1, month:@month-2).group(:week).order(:week).sum(:total_day)
		# @real_sale      = Rs.where(year: @year, month:@month).group(:week).order(:week).sum(:total_day)
		# @sale_plan      = Sp.where(year: @year, month:@month).group(:week).order(:week).sum(:sale)
		historic_sale   = @historic_sale

		@dif1 =[]
		@dif2 =[]
		@sale_plan.each do |k,v|
			if k < 5
				@dif1 << ( (@real_sale[k] / v) -1) * 100
				@dif2 << ( (@real_sale[k] / historic_sale[k] ) -1) * 100
			end
		end
	end
end
