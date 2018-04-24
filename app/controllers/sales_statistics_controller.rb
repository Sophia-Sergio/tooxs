class SalesStatisticsController < ApplicationController
	def show
	    add_breadcrumb "Dashboard", :root_path
	    add_breadcrumb "Estadísticas de venta", :sales_statistic_path   
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

		@year  = 2018  
		@month = 1

		beginning_of_month = "#{@year}-#{@month}-01".to_date
		end_of_month = beginning_of_month.end_of_month

		week_start = beginning_of_month.strftime("%V")
		week_end   = end_of_month.strftime("%V")

		#week fix if is last week of the year on first month
		week_start = '01' if week_start.to_i == 53  

		@historic_sale  = Hs.where(year: @year - 1, month:@month).group(:week).order(:week).sum(:total_day)
		@real_sale      = Rs.where(year: @year, month:@month).group(:week).order(:week).sum(:total_day)
		@sale_plan      = Sp.where(year: @year, month:@month).group(:week).order(:week).sum(:sale)
		historic_sale   = @historic_sale
		#binding.pry

		@dif1 =[]
		@dif2 =[]
		@sale_plan.each do |k,v|
			@dif1 << ( (@real_sale[k] / v) -1) * 100
			@dif2 << ( (@real_sale[k] / historic_sale[k] ) -1) * 100
		end

		    #staffing 
		@staffing_w1 = staffing_draw(20180226)
		@staffing_w2 = staffing_draw(20180305)
		@staffing_w3 = staffing_draw(20180312)
		@staffing_w4 = staffing_draw(20180319)     	
	end
end
