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
        @stores       = Store.all.order(:id)
        @departments  = Department.all.order(:id)

        month  = params[:month].to_i
        year   = params[:year].to_i
        @store = params[:store].to_i
        @dep   = params[:department].to_i

        #days of the week for this query dias de la semana según comienzo
        @w1_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 1, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
        @w2_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 2, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
        @w3_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 3, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
        @w4_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 4, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}

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
        @brain_json = brain_json()
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
        @w1_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 1, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
        @w2_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 2, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
        @w3_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 3, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
        @w4_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 4, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}


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

    def brain_json

        month = params[:month].to_i
        year = params[:year].to_i
        store = params[:store].to_i
        department = params[:department].to_i

        #[1,hora 10,dia 28,1]       
        m1 = SalePlan.where(month: month, year: year).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}

        w1 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 1, store_id: store, department_id: department).where(:year => year).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}
        w2 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 2, store_id: store, department_id: department).where(:year => year).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}
        w3 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 3, store_id: store, department_id: department).where(:year => year).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}
        w4 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 4, store_id: store, department_id: department).where(:year => year).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}
        w5 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 5, store_id: store, department_id: department).where(:year => year).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}

        staffingM1 = staffing_draw(w1)[:sellers_per_day] + staffing_draw(w2)[:sellers_per_day] + staffing_draw(w3)[:sellers_per_day] + staffing_draw(w4)[:sellers_per_day]

        if w5.count > 0
            staffingM1 += staffing_draw(w5)[:sellers_per_day]           
        end
       
        dataCase = DataCase.where(month: month, year: year, dep_num: @dep)
        
        if dataCase.blank? == true
            # debería crear un caso automático en este caso cargaremos uno predefinido
            case_api = 33
        else
            case_api = dataCase.first[:id_case]
        end
            staffingCase = StaffingCase.where(id_case: case_api.to_i).first
            dataCase = DataCase.where(id_case: case_api.to_i).first       

        @data = { "accion": "ejecutar", 
            "id_caso": staffingCase.id_case.to_i,    
            "tolerancia": (3).round(1), 
            "evaluar_dotacion_real": staffingCase.actual_staffing_eval.to_i,    
            "tiempo_maximo": staffingCase.max_time.to_i,    
            "usuario": staffingCase.user.to_s, 
            "datos": 
            {  
                "num_turnos": dataCase.turn_num,
                "num_departamentos": dataCase.dep_num,
                "num_ventanas": 1,
                "num_dias_ventana": dataCase.day_num,
                "num_horas_dia": dataCase.hour_day,
                "valor_hp": dataCase.hp_val.round(1),
                "prod_obj": dataCase.prod_obj.round(1),
                "VHP": "", 
                "POV": dataCase.pov,
                "Entrada_Almuerzo": dataCase.lunch_in,  
                "Horas_Almuerzo": dataCase.lunch_hours,
                "min_horas": dataCase.hour_min,  
                "matriz_turnos": dataCase.turns_matrix.to_s, 
                "dotacion_real": dataCase.real_dot.to_s, 
                "plan_venta": dataCase.sale_plan.to_s
            }
        }.to_json
        return @data
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

        #days of the week for this query dias de la semana según comienzo
        @w1_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 1, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
        @w2_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 2, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
        @w3_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 3, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
        @w4_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 4, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}

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
        @brain_json = brain_json()    
    end
end

