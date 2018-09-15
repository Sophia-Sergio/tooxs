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

		@plan = JSON.parse(@brain_json)

		dotReal = dotacion_real(@dep, month, year)

		@dotacion_w_op = calculo_semanal(cerebro_sumatoria_turnos_optimizado(@brain_json, dataCase.first[:id_case]), 7)
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

        #sales plan per day
        @sp_w1_daily = SalePlan.where(year: year, month: month, week: 1, store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}
        @sp_w2_daily = SalePlan.where(year: year, month: month, week: 2, store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}
        @sp_w3_daily = SalePlan.where(year: year, month: month, week: 3, store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}
        @sp_w4_daily = SalePlan.where(year: year, month: month, week: 4, store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}

        #staffdrawing per week
        @sd_w1 = staffing_draw(w1)[:draw].values.flatten.sum
        @sd_w2 = staffing_draw(w2)[:draw].values.flatten.sum
        @sd_w3 = staffing_draw(w3)[:draw].values.flatten.sum
        @sd_w4 = staffing_draw(w4)[:draw].values.flatten.sum

        #staffdrawing per day-week
        @sd_w1_daily  = staffing_draw(w1)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}
        @sd_w2_daily  = staffing_draw(w2)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}
        @sd_w3_daily  = staffing_draw(w3)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}
        @sd_w4_daily  = staffing_draw(w4)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}

        #productivity per day-week
        @prd_w1_day = @sp_w1_daily.zip(@sd_w1_daily).map{|a,b| a/b }
        @prd_w2_day = @sp_w2_daily.zip(@sd_w2_daily).map{|a,b| a/b }
        @prd_w3_day = @sp_w3_daily.zip(@sd_w3_daily).map{|a,b| a/b }
        @prd_w4_day = @sp_w4_daily.zip(@sd_w4_daily).map{|a,b| a/b }

        @data = { :dates_week => @w1_days,
              :dates_week_2 => @w2_days,
              :dates_week_3 => @w3_days,
              :dates_week_4 => @w4_days, 
              :sp => @sp_w1_daily, 
              :sd => @sd_w1_daily, 
              :prd => @prd_w1_day, 
              :prd1 => @prd_w2_day,
              :prd2 => @prd_w3_day, 
              :prd3 => @prd_w4_day,
              :spm1 => @sp_m1,
              :tsm1 => @totalMonth, 
              :vrm1 => @realMonth,
              :vent_real => @realMonth.sum,
              :dot_real => @dotMonth.sum
            }

        return @data
    end
end
