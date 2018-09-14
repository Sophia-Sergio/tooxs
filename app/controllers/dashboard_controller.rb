class DashboardController < ApplicationController
	def index
		add_breadcrumb "Dashboard", :root_path
		department = 1
		store = 1
		@search  = ''
		@year = Date.today.strftime("%Y").to_i      

        if params[:month]
        	@month = params[:month]
        else
        	@month = 6
        end
		@department   = department
		@store 	      = store
       	@search       = ''
        @stores       = Store.where(id: @store).order(:id)
        @departments  = Department.where(id: department).order(:id)

        dayMonth = Date.today.strftime("%w").to_i
        dayNow = day_now_charged
        #dayNow = day_now(Date.today.strftime("%Y").to_s, Date.today.strftime("%m").to_s)

		assigned_shift = Seller.where(department: department, store: store ).pluck(:assigned_shift)
		turnos = Array.new(12, 0)

		dataCase = DataCase.where(dep_num: department, month: @month).first
		summaryCaseOut = SummaryCase.where( id_case: dataCase.id_case, type_io: 'out').first
		summaryCaseIn = SummaryCase.where( id_case: dataCase.id_case, type_io: 'in').first
		if summaryCaseOut
			@margin_adjustment = summaryCaseOut.margin_adjustment.to_f
			@prod_obj = dataCase.prod_obj.to_f
			@prod_real = setNum((@prod_obj * @margin_adjustment) / 100)
			opt_turn = summaryCaseOut.real_dot.tr('{', '').tr(' ','').tr('}', '').split(%r{,\s*})
		else
			opt_turn = []
			@prod_obj = 0
			@prod_real = 0
			@margin_adjustment = 0
		end
		
		# calcular turnos cubiertos
		if summaryCaseIn
			ent_turn = summaryCaseIn.real_dot.tr('{', '').tr(' ','').tr('}', '').split(%r{,\s*})
		else
			ent_turn = 0
		end
		turnosOptimizados = Array.new(12, 0)
		turnosEntrada = Array.new(12, 0)
		countTurnos = 0
		
		sellers = Seller.where(department: department, store: store ).pluck(:assigned_shift)

		sellers.each do |turn|
			turnosEntrada[turn.to_i-1] += 1
		end

		opt_turn.each do |turn|
			turn = turn.split(":")
			turnosOptimizados[turn[0].to_i-1] = turn[1].to_i
			#ads
		end

		assigned_shift.each do |x|
			turnos[x] += 1
		end

		turnosOpTotal = turnosOptimizados.sum
		turnosOpId = []

		for i in 0..turnosOptimizados.length - 1

			if turnosOptimizados[i] - turnosEntrada[i] > 0
				turnosOpTotal = turnosOpTotal - (turnosOptimizados[i] - turnosEntrada[i])
			end

			if turnosOptimizados[i] != 0  
				turnosOpId << i + 1
			end
		end

		@sellers = Seller.where(department: department, store: store)

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

        @turnosEntrada = turnosEntrada
        @turnosOptimizados = turnosOptimizados

		@turnos_cubiertos = []

		if turnosOptimizados.sum != 0
			@turnos_cubiertos = { :texto => " #{turnosOpTotal} de #{turnosOptimizados.sum}", :porcentaje => ( turnosOpTotal* 100 / turnosOptimizados.sum).round }
		else
			@turnos_cubiertos = { :texto => " #{turnosOpTotal} de #{turnosOptimizados.sum}", :porcentaje => 0 }	
		end

		# calcular cumplimiento del plan
		ventaTotal = SaleBySeller.where(month: @month, department: department, year: @year).sum("sale").to_f
		if summaryCaseOut
			planVenta = summaryCaseOut.sale_plan.to_f
			@cumplimientoPlan = (@ventaTotal / @planVentaTotal * 100).round(1)	
		else
			planVenta = 0
			@cumplimientoPlan = 0
		end
		#obtener productividad real
		dotReal = dotacion_real
		
        #obtener ventas reales del mes 
        sale_reals = SaleReal.where(department_id: department, store_id: store, year: @year, month: @month) 
        @realMonth = []
		@dotMonth = []
		@totalMonth = []
		@contReal = 0
        
        sale_reals.each do |sale|
            totalRealDay = sale[:nine]+sale[:ten]+sale[:eleven]+sale[:twelve]+sale[:thirteen]+sale[:fourteen]+sale[:fifteen]+sale[:sixteen]+sale[:seventeen]+sale[:eighteen]+sale[:nineteen]+sale[:twenty]+sale[:twenty_one]+sale[:twenty_two]+sale[:twenty_three]+sale[:twenty_four]
            @realMonth  << totalRealDay
            @totalMonth << (totalRealDay.to_f / dotReal[@month][@contReal]).round
            @contReal += 1            
        end

        # productividad objetivo

        # @prod_obj,  @totalMonth, @dotMonth

        #calcular exceso real
        excesoReal = matrix_calc(@prod_obj, @totalMonth, dotReal[@month])

        # obtener real
        # excesoTotal = Calculo.excesoTotal(excesoReal);
        # faltanteTotal = Calculo.faltanteTotal(excesoReal);

        # 189.437.598 / 85000 = ese el 100% de horas...
        totalHour = (@realMonth.sum / @prod_obj)

        # 711 + 24 = 67 % (menos 1 )
        @margin_adjustment = (1 - ((excesoReal[:exceso] + excesoReal[:faltante]) / totalHour)).round(4) * 100 

		@prod_real = (@realMonth.sum / dotReal[@month].sum).round
	end

	def sale_real_per_seller(seller,year,month)
      @dep   = seller.department.id
      @year  = year    
      @month = month
      return SaleBySeller.where(month: month, seller: seller.id, department: @dep, year: @year).sum("sale")
    end

    def matrix_calc (prod_obj, matrix, staff)
    	exceso = 0
    	faltante = 0
    	matrixSet = []

    	(matrix.length).times do |i|

    		calculo = -((((matrix[i] - prod_obj) * staff[i]) / prod_obj)).round 

    		if calculo >= 0
    			exceso += calculo
    		else
    			faltante += calculo
    		end

    		matrixSet << calculo 
    	
    	end

    	data = {:exceso => exceso, :faltante => -faltante, :matrixSet => matrixSet }
    	
    	return data
    end
end
