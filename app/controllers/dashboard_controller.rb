class DashboardController < ApplicationController
	def index
		add_breadcrumb "Dashboard", :root_path
		department = 1
		store = 1
		@sellers = Seller.where(store: store, department: department)
		@year = Date.today.strftime("%Y").to_i
        @month = 6#Date.today.strftime("%m").to_i
        dayMonth = Date.today.strftime("%w").to_i
        dayNow = day_now_charged
        #dayNow = day_now(Date.today.strftime("%Y").to_s, Date.today.strftime("%m").to_s)

        @setSellers = []

        @sellers.each do |seller|
	        seller_plan = seller_staffing(seller, @month, @year)
	        plan = 0
	        (1..dayNow[:week]).each do |week|
	        	plan += seller_plan[week - 1].first.values.first[:seller_plan_per_day].inject(:+)
	        end

	       	sale = sale_real_per_seller(seller, @year, @month)
			
			cumplimiento = ((sale.to_f / plan.to_f) * 100).round(2)
        	@setSellers << { :seller => seller, 
        					 :sale => setNum(sale), 
        					 :plan => setNum(plan),
        					 :cumplimiento => cumplimiento }
        end

		assigned_shift = Seller.where(store: 1, department: 1).pluck(:assigned_shift)
		turnos = Array.new(12, 0)

		dataCase = DataCase.where(dep_num: department, month: @month).first
		summaryCase = SummaryCase.where( id_case: dataCase.id_case, type_io: 'out').first
		
		@margin_adjustment = summaryCase.margin_adjustment.to_f
		@prod_obj = dataCase.prod_obj.to_f
		@prod_real = setNum((@prod_obj * @margin_adjustment) / 100)
		
		# calcular turnos cubiertos
		opt_turn = summaryCase.real_dot.tr('{', '').tr(' ','').tr('}', '').split(%r{,\s*})
		turnosOptimizados = Array.new(12, 0)

		opt_turn.each do |turn|
			turn = turn.split(":")
			turnosOptimizados[turn[0].to_i-1] = turn[1].to_i
		end
		assigned_shift.each do |x|
			turnos[x] += 1
		end

		turnosOpTotal = turnosOptimizados.sum

		for i in 0..turnosOptimizados.length - 1
			if (turnosOptimizados[i] > turnos[i])
				turnosOpTotal = turnosOpTotal - (turnosOptimizados[i] - turnos[i])
			end
		end

		@turnos_cubiertos = []

		@turnos_cubiertos = { :texto => " #{turnosOpTotal} de #{turnosOptimizados.sum}", :porcentaje => ( turnosOpTotal* 100 / turnosOptimizados.sum).round }

		# calcular cumplimiento del plan
		ventaTotal = SaleBySeller.where(month: @month, department: department, year: @year).sum("sale").to_f
		planVenta = summaryCase.sale_plan.to_f

		@cumplimientoPlan = (ventaTotal / planVenta * 100).round(2)	
	end

	def sale_real_per_seller(seller,year,month)
      @dep   = seller.department.id
      @year  = year    
      @month = month
      return SaleBySeller.where(month: month, seller: seller.id, department: @dep, year: @year).sum("sale")
    end
end
