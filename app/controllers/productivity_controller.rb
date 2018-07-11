class ProductivityController < ApplicationController

    def index
        params[:year]  = Date.today.strftime("%Y").to_i
        params[:month] = Date.today.strftime("%m").to_i
        params[:department] = 1
        params[:store] = 1


        add_breadcrumb "Dashboard", :root_path
        add_breadcrumb "Buscar", :productivity_index_path    
        @search       = ''
        @stores       = Store.all.order(:id)
        @departments  = Department.all.order(:id)
    end

    def show
        add_breadcrumb "Dashboard", :root_path
        add_breadcrumb "Buscar", :productivity_index_path   
        add_breadcrumb "Productividad", :productivity_show_path    
        @search       = ''
        @stores       = Store.all.order(:id).joins("INNER JOIN departments ON stores.id = departments.store_id INNER JOIN data_cases ON departments.id = data_cases.dep_num").distinct 
        @departments  = Department.all.order(:id).joins("INNER JOIN data_cases ON departments.id = data_cases.dep_num").distinct

        month  = params[:month].to_i
        year   = params[:year].to_i
        @store = params[:store].to_i
        @dep   = params[:department].to_i

        #days of the week for this query dias de la semana según comienzo
        @w1_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 1, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d').to_sym}
        @w2_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 2, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d').to_sym}
        @w3_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 3, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d').to_sym}
        @w4_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 4, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d').to_sym}

        #staffing
        fecha1 = DateTime.parse(@w1_days[0].to_s) 
        fecha1 = fecha1.strftime("%Y%m%d")

        fecha2 = DateTime.parse(@w2_days[0].to_s) 
        fecha2 = fecha2.strftime("%Y%m%d")

        fecha3 = DateTime.parse(@w3_days[0].to_s) 
        fecha3 = fecha3.strftime("%Y%m%d")

        fecha4 = DateTime.parse(@w4_days[0].to_s) 
        fecha4 = fecha4.strftime("%Y%m%d")

        @staffing_w1  = staffing_draw(fecha1)
        @staffing_w2  = staffing_draw(fecha2)
        @staffing_w3  = staffing_draw(fecha3)
        @staffing_w4  = staffing_draw(fecha4)
        @brain_json = brain_json(month, year, @store, @dep)
    end

    def json_current

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

        render json: @data
    end

    def get_real_dot
        turns      = AvailableShift.all
        turnsTotal = AvailableShift.distinct.pluck(:num)
        turns_matrix = ""
        turnsTotal.each do |i|            
            turn = AvailableShift.where(num: i)
            j = 1
            turn.each do |s|
                (s.eleven) ? turns_matrix += " [#{i.to_i},1,#{j}] 1," : ""
                (s.twelve) ? turns_matrix += " [#{i.to_i},2,#{j}] 1," : ""
                (s.thirteen) ? turns_matrix += " [#{i.to_i},3,#{j}] 1," : ""
                (s.fourteen) ? turns_matrix += " [#{i.to_i},4,#{j}] 1," : ""
                (s.fifteen) ? turns_matrix += " [#{i.to_i},5,#{j}] 1," : ""
                (s.sixteen) ? turns_matrix += " [#{i.to_i},6,#{j}] 1," : ""
                (s.seventeen) ? turns_matrix += " [#{i.to_i},7,#{j}] 1," : ""
                (s.eighteen) ? turns_matrix += " [#{i.to_i},8,#{j}] 1," : ""
                (s.nineteen) ? turns_matrix += " [#{i.to_i},9,#{j}] 1," : ""
                (s.twenty) ? turns_matrix += " [#{i.to_i},10,#{j}] 1," : ""
                j += 1
            end
        end 
        turns_matrix = turns_matrix.slice 1 .. -2
        return turns_matrix
    end

    def data_month

        month = params[:month].to_i
        year = params[:year].to_i
        store = params[:store].to_i
        department = params[:department].to_i

        summary = "";
        dataCase = DataCase.where(month: month, year: year, dep_num: department)    

        if dataCase.blank? == true
            summary = ''
            existe = false           
            json_result = ''
        else
            returnCase = ReturnCase.where(id_case: dataCase.first[:id_case]).first  
            if File.exist?(File.join(Rails.root, 'public', "caso#{dataCase.first[:id_case]}.txt"))
                File.open(File.join(Rails.root, 'public', "caso#{dataCase.first[:id_case]}.txt"), 'r')do |f1|  
                  while line = f1.gets 
                    if line == ""
                        line = "\n"    
                    end 
                    summary += "#{line}"
                  end  
                end
                existe = true
                json_result = "{\"margen_eficiencia\":\"#{returnCase.eff_margin}\",\"excedente_total\":#{returnCase.total_surplus},\"costo_remuneracion\":#{returnCase.compensation_cost}, \"status\":\"#{returnCase.status}\",\"usuario\":\"#{returnCase.user}\",\"id_caso\":\"#{returnCase.id_case}\",\"mensaje\":\"#{returnCase.message}\", \"deficit_total\":#{returnCase.deficit_total},\"tolerancia\":\"#{returnCase.tolerance}\",\"version\":\"#{returnCase.version}\", \"formato_resultado\":{\"almuerzo\":\"[turno_i,departamento_j,período_t] valor, [...\", \"delta\":\"[departamento_j,período_t] valor, [...\"}, \"tiempo_maximo\":\"#{returnCase.max_time}\",\"resultado\":{\"almuerzos\":\"#{returnCase.lunchs}\",\"turnos\":\"#{returnCase.turns}\",\"delta\":\"#{returnCase.delta}\", \"epsilon\":\"#{returnCase.epsilon}\"},\"soporte\":\"fatapia@scipion.cl\",\"modelo\":\"#{returnCase.model}\",\"plan_venta\":#{returnCase.sales_plan}, \"funcion_objetivo\":#{returnCase.obj_function}}"         
            else
                summary = ''
                existe = false           
                json_result = ''            
            end
        end

        @data = { :existe => existe, :summary => summary, :json_result => json_result}
        render json: @data     
    end

    def report
        add_breadcrumb "Dashboard", :root_path
        add_breadcrumb "Reporte de Productividad", :productivity_report_path    
        @search       = ''
        @stores       = Store.all.order(:id)
        @departments  = Department.all.order(:id)

        month  = params[:month].to_i
        year   = params[:year].to_i
        @store = params[:store].to_i
        @dep   = params[:department].to_i

        @report_data = report_data
        @brain_json = brain_json(month, year, @store, @dep)    
        dataCase = DataCase.where(month: month, year: year, dep_num: @dep)
        
        @plan_w = calculo_semanal(@report_data[:spm1], 7)
        @plan_w_op = calculo_semanal(cerebro_plan_venta_opt(@brain_json), 7)
        @plan_w_real = calculo_semanal(@report_data[:vrm1], 7)

        dotReal = dotacion_real
        @plan = JSON.parse(@brain_json)


        @dotacion_w = calculo_semanal(cerebro_sumatoria_turnos_diaria(@brain_json), 7)       
        @dotacion_w_op = calculo_semanal(cerebro_sumatoria_turnos_optimizado(@brain_json, dataCase.first[:id_case]), 7)
        @dotacion_w_real = calculo_semanal(dotReal[month], 7)

        if @plan_w_real.length > 4 #limitación para muestra
            @plan_w_real.delete_at(4)
            @dotacion_w_real.delete_at(4)
        end

        @prod_w = cerebro_calculo_productividades_week(@plan_w, @dotacion_w)
        @prod_w_op = cerebro_calculo_productividades_week(@plan_w_op, @dotacion_w_op)
        @prod_w_real = cerebro_calculo_productividades_week(@plan_w_real, @dotacion_w_real)


        @plan_w_total = []
        @plan_w_total << { :type => "sop", :name => "Productividad sin Optimizar", :plan_w => @plan_w, :dot_w => @dotacion_w, :prod_w => @prod_w }
        @plan_w_total << { :type => "op", :name => "Productividad Optimizada", :plan_w => @plan_w_op, :dot_w => @dotacion_w_op, :prod_w => @prod_w_op }
        @plan_w_total << { :type => "real", :name => "Productividad Real", :plan_w => @plan_w_real, :dot_w => @dotacion_w_real, :prod_w => @prod_w_real }
    end

        def report_data

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

