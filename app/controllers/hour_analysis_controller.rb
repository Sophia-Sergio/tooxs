class HourAnalysisController < ApplicationController
	def index
		add_breadcrumb "Dashboard", :root_path
		add_breadcrumb "Análisis de horas", :hour_analysis_index_path    
		@search       = ''
		@stores       = Store.all.order(:id)
		@departments  = Department.all.order(:id)

		month  = params[:month].to_i
		year   = params[:year].to_i
		@store = params[:store].to_i
		@dep   = params[:department].to_i


		#obtener ventas reales del mes 
		sale_reals = SaleReal.where(department_id: @dep, store_id: @store, year: year, month: month) 
		@realMonth = []

		sale_reals.each do |sale|
		totalRealDay = sale[:nine]+sale[:ten]+sale[:eleven]+sale[:twelve]+sale[:thirteen]+sale[:fourteen]+sale[:fifteen]+sale[:sixteen]+sale[:seventeen]+sale[:eighteen]+sale[:nineteen]+sale[:twenty]+sale[:twenty_one]+sale[:twenty_two]+sale[:twenty_three]+sale[:twenty_four]
		@realMonth  << totalRealDay
		end

		@data = data
		@brain_json = brain_json(month, year, @store, @dep)    
		dataCase = DataCase.where(month: month, year: year, dep_num: @dep)

		@venta_w_real = calculo_semanal(@realMonth, 7)

		if @venta_w_real.length > 4 #limitación para muestra
		@venta_w_real.delete_at(4)
		end

        if @brain_json
            @plan = JSON.parse(@brain_json)       
        end

		dotReal = dotacion_real(@dep, month, year)
        if dataCase.length > 0
		  @dotacion_w_op = calculo_semanal(cerebro_sumatoria_turnos_optimizado(@brain_json, dataCase.first[:id_case]), 7)
        else
          @dotacion_w_op = []
        end
		@dotacion_w_real = calculo_semanal(dotReal, 7)

		@prod_w_op = cerebro_calculo_productividades_week(@venta_w_real, @dotacion_w_op)
		@prod_w_real = cerebro_calculo_productividades_week(@venta_w_real, @dotacion_w_real)

		@plan_w_total = []
		@plan_w_total << { :type => "op", :name => "Productividad optimizada", :plan_w => @venta_w_real, :dot_w => @dotacion_w_op, :prod_w => @prod_w_op }
		@plan_w_total << { :type => "real", :name => "Productividad real", :plan_w => @venta_w_real, :dot_w => @dotacion_w_real, :prod_w => @prod_w_real }
	end

    def data

        #dummy demo data
        month  = params[:month].to_i
        year   = params[:year].to_i  
        @store = params[:store].to_i
        @dep   = params[:department].to_i

        #dates per week
        w1 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 1, store_id: @store, department_id: @dep).where(:year => year).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}
        w2 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 2, store_id: @store, department_id: @dep).where(:year => year).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}
        w3 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 3, store_id: @store, department_id: @dep).where(:year => year).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}
        w4 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 4, store_id: @store, department_id: @dep).where(:year => year).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}

        #days of the week for this query
        @w1_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 1, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d').to_sym}
        @w2_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 2, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d').to_sym}
        @w3_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 3, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d').to_sym}
        @w4_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 4, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d').to_sym}


        #sales plan per week
        @sp_w1 = SalePlan.where(year: year).where(month: month).where(week: 1, store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}.sum
        @sp_w2 = SalePlan.where(year: year).where(month: month).where(week: 2, store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}.sum
        @sp_w3 = SalePlan.where(year: year).where(month: month).where(week: 3, store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}.sum
        @sp_w4 = SalePlan.where(year: year).where(month: month).where(week: 4, store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}.sum


        @sp_m1 = SalePlan.where(year: year).where(month: month, store_id: @store, department_id: @dep).where("week IN(?,?,?,?)", 1, 2, 3, 4).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}

        #obtener ventas reales del mes 
        sale_reals = SaleReal.where(department_id: @dep, store_id: @store, year: year, month: month) 
        @totalMonth = []
        @realMonth = []
        @dotMonth = []

        sale_reals.each do |sale|
            totalRealDay = sale[:nine]+sale[:ten]+sale[:eleven]+sale[:twelve]+sale[:thirteen]+sale[:fourteen]+sale[:fifteen]+sale[:sixteen]+sale[:seventeen]+sale[:eighteen]+sale[:nineteen]+sale[:twenty]+sale[:twenty_one]+sale[:twenty_two]+sale[:twenty_three]+sale[:twenty_four]
            totalDotDay = staffing[("#{sale[:sale_date].strftime("%Y%m%d")}").to_sym][:hours].values.sum
            @realMonth  << totalRealDay
            @dotMonth   << totalDotDay
            @totalMonth << (totalRealDay.to_f / totalDotDay.to_f).round
        end

        @data = { :dates_week => @w1_days,
              :dates_week_2 => @w2_days,
              :dates_week_3 => @w3_days,
              :dates_week_4 => @w4_days, 
              :spm1 => @sp_m1,
              :tsm1 => @totalMonth, 
              :vrm1 => @realMonth,
              :vent_real => @realMonth.sum,
              :dot_real => @dotMonth.sum
            }

        return @data
    end
end
