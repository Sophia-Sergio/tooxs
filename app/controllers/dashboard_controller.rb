class DashboardController < ApplicationController
  include DemoParameters

	def index
    @month = params[:month] || demo_data[:date].month
    @store = demo_data[:store]
		@department  = demo_data[:department]
    @search      = demo_data[:search]
    @stores      = Store.where(id: demo_data[:store]).order(:id)
    @departments = Department.where(id: demo_data[:department]).order(:id)
		@year  = Date.today.year
    dayNow = day_now_charged
		turnos = Array.new(12, 0)
		dataCase = DataCase.where(dep_num: demo_data[:department], month: @month).first
		summaryCaseOut = SummaryCase.where(id_case: dataCase.id_case, type_io: 'out').first if dataCase

		if summaryCaseOut
			@margin_adjustment = summaryCaseOut.margin_adjustment.to_f
			@prod_obj = dataCase.prod_obj.to_f
			@prod_real = setNum((@prod_obj * @margin_adjustment) / 100)
		else
			@prod_obj = 0
			@prod_real = 0
			@margin_adjustment = 0
		end

		#turnos cubiertos
		if dataCase
	   	shifts_covered_data = shifts_covered(dataCase.id_case, @department, @store)
			turnosOpTotal = shifts_covered_data[:turnosOpTotal]
			@turnosEntrada = shifts_covered_data[:turnosEntrada]
			@turnosOptimizados = shifts_covered_data[:turnosOptimizados]
		end

		@sellers = Seller.where(department: demo_data[:department], store:  demo_data[:store])
		@setSellers = []
		@planVentaTotal = 0
		@ventaTotal = 0

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
      @planVentaTotal += plan
      @ventaTotal += sale
    end

		@turnos_cubiertos = []
		if @turnosOptimizados
			if @turnosOptimizados.sum != 0
				@turnos_cubiertos = { :texto => " #{turnosOpTotal} de #{@turnosOptimizados.sum}", :porcentaje => ( turnosOpTotal* 100 / @turnosOptimizados.sum).round }
			else
				@turnos_cubiertos = { :texto => " #{turnosOpTotal} de #{@turnosOptimizados.sum}", :porcentaje => 0 }
			end
		end

		# calcular cumplimiento del plan
		ventaTotal = SaleBySeller.where(month: @month, department: @department, year: @year).sum("sale").to_f
		if summaryCaseOut
			planVenta = summaryCaseOut.sale_plan.to_f
      @cumplimientoPlan = (@ventaTotal / @planVentaTotal * 100).round(1)
		else
			planVenta = 0
			@cumplimientoPlan = 0
		end
		#obtener productividad real
		dotReal = dotacion_real(@department, @month, @year)

    #obtener ventas reales del mes
    sale_reals = SaleReal.where(department_id: @department, store_id: @store, year: @year, month: @month)
    @realMonth = []
		@totalMonth = []
		@contReal = 0

    if dotReal.length > 0
      sale_reals.each do |sale|
        totalRealDay = sale[:nine]+sale[:ten]+sale[:eleven]+sale[:twelve]+sale[:thirteen]+sale[:fourteen]+sale[:fifteen]+sale[:sixteen]+sale[:seventeen]+sale[:eighteen]+sale[:nineteen]+sale[:twenty]+sale[:twenty_one]+sale[:twenty_two]+sale[:twenty_three]+sale[:twenty_four]
        @realMonth  << totalRealDay
        @totalMonth << (totalRealDay.to_f / dotReal[@contReal]).round
        @contReal += 1
      end
      excesoReal = matrix_calc(@prod_obj, @totalMonth, dotReal)
      totalHour = (@realMonth.sum / @prod_obj)
      @margin_adjustment = (1 - ((excesoReal[:exceso] + excesoReal[:faltante]) / totalHour)).round(4) * 100
			@prod_real = (@realMonth.sum / dotReal.sum).round
    end
	end

	def sale_real_per_seller(seller,year,month)
      @dep   = seller.department.id  
      SaleBySeller.where(month: month, seller: seller.id, department: @dep, year: year).sum("sale")
  end
end
