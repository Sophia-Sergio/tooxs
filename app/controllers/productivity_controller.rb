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

        #dates per month
        m1 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:year => year, store_id: @store, department_id: @dep).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}
        #dates per week fecha de comienzo de la semana
        w1 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 1, store_id: @store, department_id: @dep).where(:year => year).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}
        w2 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 2, store_id: @store, department_id: @dep).where(:year => year).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}
        w3 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 3, store_id: @store, department_id: @dep).where(:year => year).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}
        w4 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 4, store_id: @store, department_id: @dep).where(:year => year).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}

        #days of the week for this query dias de la semana según comienzo
        @w1_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 1, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
        @w2_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 2, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
        @w3_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 3, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
        @w4_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 4, store_id: @store, department_id: @dep).where(:year => year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}


        #sales plan per week plan de venta total por semana
        @sp_w1 = SalePlan.where(year: year).where(month: month).where(week: 1, store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}.sum
        @sp_w2 = SalePlan.where(year: year).where(month: month).where(week: 2, store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}.sum
        @sp_w3 = SalePlan.where(year: year).where(month: month).where(week: 3, store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}.sum
        @sp_w4 = SalePlan.where(year: year).where(month: month).where(week: 4, store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}.sum

        @sp_m1 = SalePlan.where(year: year).where(month: month, store_id: @store, department_id: @dep).where("week IN(?,?,?,?)", 1, 2, 3, 4).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}

        #sales plan per day plan de venta total por día 
        @sp_w1_daily = SalePlan.where(year: year, month: month, week: 1, store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}
        @sp_w2_daily = SalePlan.where(year: year, month: month, week: 2, store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}
        @sp_w3_daily = SalePlan.where(year: year, month: month, week: 3, store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}
        @sp_w4_daily = SalePlan.where(year: year, month: month, week: 4, store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}

        #staffdrawing per week turnos hora por semana 
        @sd_w1 = staffing_draw(w1)[:draw].values.flatten.sum
        @sd_w2 = staffing_draw(w2)[:draw].values.flatten.sum
        @sd_w3 = staffing_draw(w3)[:draw].values.flatten.sum
        @sd_w4 = staffing_draw(w4)[:draw].values.flatten.sum

        #staffdrawing per day-week turnos hora por semana
        @sd_w1_daily  = staffing_draw(w1)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}
        @sd_w2_daily  = staffing_draw(w2)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}
        @sd_w3_daily  = staffing_draw(w3)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}
        @sd_w4_daily  = staffing_draw(w4)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}


        #productivity per day-week
        @prd_w1_day = @sp_w1_daily.zip(@sd_w1_daily).map{|a,b| a/b }
        @prd_w2_day = @sp_w2_daily.zip(@sd_w2_daily).map{|a,b| a/b }
        @prd_w3_day = @sp_w3_daily.zip(@sd_w3_daily).map{|a,b| a/b }
        @prd_w4_day = @sp_w4_daily.zip(@sd_w4_daily).map{|a,b| a/b }

        #productivity per week-month
        @prd_w1 = (@sp_w1 / @sd_w1)
        @prd_w2 = (@sp_w2 / @sd_w2)
        @prd_w3 = (@sp_w3 / @sd_w3)
        @prd_w4 = (@sp_w4 / @sd_w4)

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
        #binding.pry
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

        @pam1 = @prd_w1_day + @prd_w2_day + @prd_w3_day + @prd_w4_day


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
              :pam1 => @pam1,
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
            case_api = 32
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
            File.open(File.join(Rails.root, 'public', 'caso29.txt'), 'r')do |f1|  
              while line = f1.gets 
                if line == ""
                    line = "\n"    
                end 
                summary += "#{line}"
              end  
            end
            existe = false           
            json_result = '{"margen_eficiencia":"137.5%","excedente_total":10168130,"costo_remuneracion":0,"status":"FACTIBLE","usuario":"fatapia@scipion.cl","id_caso":"29","mensaje":"Proceso ejecutado con éxito","deficit_total":16604190,"tolerancia":"3.0%","version":"v1.2 18 de marzo de 2018","formato_resultado":{"almuerzo":"[turno_i,departamento_j,período_t] valor, [... ","delta":"[departamento_j,período_t] valor, [... ","epsilon":"[departamento_j,período_t] valor, [... ","turno":"[turno_i,departamento_j,ventana_w] valor, [... "},"tiempo_maximo":"1.0 min","resultado":{"almuerzos":"[4,1,3] 1, [8,1,4] 1, [3,1,5] 1, [1,1,13] 1, [1,1,14] 1, [4,1,15] 1, [2,1,23] 2, [2,1,44] 1, [2,1,45] 1, [8,1,53] 1, [10,1,53] 1, [4,1,54] 1, [10,1,54] 1, [2,1,55] 2, [2,1,63] 2, [4,1,63] 1, [8,1,63] 1, [10,1,63] 2, [4,1,73] 2, [8,1,74] 2, [2,1,75] 2, [2,1,83] 2, [4,1,94] 1, [4,1,95] 1, [2,1,103] 2, [4,1,103] 1, [2,1,113] 2, [1,1,114] 1, [6,1,114] 1, [4,1,115] 1, [7,1,115] 1, [2,1,123] 2, [4,1,123] 1, [7,1,124] 1, [10,1,124] 2, [1,1,125] 1, [2,1,125] 2, [8,1,133] 1, [10,1,133] 2, [8,1,143] 1, [2,1,144] 1, [2,1,145] 1, [2,1,153] 2, [2,1,164] 1, [2,1,165] 1, [7,1,184] 1, [4,1,185] 1, [10,1,193] 3, [4,1,194] 1, [7,1,194] 1, [8,1,194] 1, [10,1,195] 3, [4,1,203] 1, [8,1,203] 1, [10,1,204] 1, [10,1,205] 1, [8,1,213] 2, [3,1,214] 1, [4,1,214] 1, [2,1,215] 2, [4,1,223] 1, [2,1,233] 2, [1,1,234] 1, [2,1,234] 1, [1,1,235] 2, [4,1,243] 1, [2,1,244] 1, [2,1,245] 1, [2,1,253] 1, [4,1,253] 1, [3,1,254] 2, [2,1,255] 1, [3,1,255] 1, [2,1,263] 1, [4,1,263] 1, [10,1,264] 2, [2,1,265] 1, [9,1,265] 1, [8,1,273] 1, [10,1,273] 2","turnos":"[2,1,1] 2, [4,1,1] 1, [7,1,1] 1, [8,1,1] 1, [10,1,1] 2","delta":"[1,1] 9693, [1,2] 9693, [1,3] 9693, [1,4] 9693, [1,5] 9693, [1,10] 9693, [1,11] 150679, [1,12] 150679, [1,20] 150679, [1,21] 199141, [1,22] 199141, [1,23] 284141, [1,24] 114141, [1,25] 114141, [1,26] 114141, [1,27] 114141, [1,28] 114141, [1,29] 114141, [1,30] 114141, [1,31] 194682, [1,32] 194682, [1,33] 24682, [1,34] 24682, [1,35] 24682, [1,36] 24682, [1,37] 24682, [1,38] 24682, [1,39] 24682, [1,40] 24682, [1,41] 262670, [1,42] 92670, [1,43] 7670, [1,44] 92670, [1,45] 7670, [1,48] 92670, [1,49] 92670, [1,51] 237992, [1,53] 47992, [1,54] 47992, [1,55] 47992, [1,60] 142992, [1,61] 149789, [1,62] 149789, [1,63] 624789, [1,64] 54789, [1,65] 54789, [1,66] 54789, [1,67] 54789, [1,68] 54789, [1,69] 54789, [1,70] 339789, [1,71] 26384, [1,73] 26384, [1,74] 26384, [1,75] 26384, [1,78] 26384, [1,79] 196384, [1,80] 196384, [1,81] 108886, [1,82] 108886, [1,83] 193886, [1,84] 23886, [1,85] 23886, [1,86] 23886, [1,87] 23886, [1,88] 23886, [1,89] 23886, [1,90] 108886, [1,91] 48167, [1,92] 48167, [1,101] 252217, [1,102] 252217, [1,103] 337217, [1,104] 82217, [1,105] 82217, [1,106] 82217, [1,107] 82217, [1,108] 82217, [1,109] 167217, [1,110] 252217, [1,111] 16698, [1,112] 101698, [1,113] 16698, [1,114] 16698, [1,115] 16698, [1,119] 16698, [1,120] 16698, [1,123] 35731, [1,124] 35731, [1,125] 35731, [1,131] 155268, [1,132] 155268, [1,133] 440268, [1,134] 155268, [1,135] 155268, [1,136] 155268, [1,137] 155268, [1,138] 155268, [1,139] 155268, [1,140] 155268, [1,151] 301763, [1,152] 301763, [1,153] 301763, [1,154] 131763, [1,155] 131763, [1,156] 131763, [1,157] 131763, [1,158] 131763, [1,159] 131763, [1,160] 301763, [1,171] 214807, [1,172] 214807, [1,173] 44807, [1,174] 44807, [1,175] 44807, [1,176] 44807, [1,177] 44807, [1,178] 44807, [1,179] 44807, [1,180] 129807, [1,181] 188316, [1,182] 18316, [1,183] 18316, [1,184] 103316, [1,185] 18316, [1,188] 18316, [1,189] 18316, [1,190] 18316, [1,191] 74374, [1,201] 139884, [1,202] 139884, [1,203] 139884, [1,204] 44884, [1,205] 44884, [1,210] 44884, [1,220] 78997, [1,221] 117435, [1,222] 117435, [1,223] 117435, [1,224] 32435, [1,225] 32435, [1,226] 32435, [1,227] 32435, [1,228] 32435, [1,229] 32435, [1,230] 117435, [1,231] 26126, [1,232] 26126, [1,233] 26126, [1,234] 26126, [1,235] 26126, [1,250] 144901, [1,252] 19983, [1,253] 19983, [1,254] 19983, [1,255] 19983, [1,260] 104983, [1,262] 28877, [1,263] 28877, [1,264] 28877, [1,265] 28877, [1,270] 123877, [1,271] 119133, [1,272] 119133, [1,273] 309133, [1,274] 24133, [1,275] 24133, [1,276] 24133, [1,277] 24133, [1,278] 24133, [1,279] 24133, [1,280] 119133","epsilon":"[1,6] 75307, [1,7] 75307, [1,8] 75307, [1,9] 75307, [1,13] 19321, [1,14] 19321, [1,15] 19321, [1,16] 104321, [1,17] 104321, [1,18] 104321, [1,19] 104321, [1,46] 77330, [1,47] 77330, [1,50] 77330, [1,52] 47008, [1,56] 142008, [1,57] 142008, [1,58] 142008, [1,59] 142008, [1,72] 143616, [1,76] 143616, [1,77] 143616, [1,93] 36833, [1,94] 36833, [1,95] 36833, [1,96] 121833, [1,97] 121833, [1,98] 121833, [1,99] 36833, [1,100] 36833, [1,116] 153302, [1,117] 153302, [1,118] 68302, [1,121] 154269, [1,122] 59269, [1,126] 249269, [1,127] 249269, [1,128] 249269, [1,129] 154269, [1,130] 59269, [1,141] 35963, [1,142] 35963, [1,143] 35963, [1,144] 35963, [1,145] 35963, [1,146] 120963, [1,147] 120963, [1,148] 120963, [1,149] 120963, [1,150] 35963, [1,161] 25024, [1,162] 25024, [1,163] 25024, [1,164] 25024, [1,165] 25024, [1,166] 110024, [1,167] 110024, [1,168] 110024, [1,169] 110024, [1,170] 110024, [1,186] 66684, [1,187] 66684, [1,192] 115626, [1,193] 20626, [1,194] 20626, [1,195] 20626, [1,196] 305626, [1,197] 305626, [1,198] 305626, [1,199] 210626, [1,200] 115626, [1,206] 50116, [1,207] 50116, [1,208] 50116, [1,209] 50116, [1,211] 91003, [1,212] 91003, [1,213] 6003, [1,214] 6003, [1,215] 6003, [1,216] 176003, [1,217] 91003, [1,218] 91003, [1,219] 6003, [1,236] 143874, [1,237] 143874, [1,238] 143874, [1,239] 58874, [1,240] 58874, [1,241] 25099, [1,242] 25099, [1,243] 25099, [1,244] 25099, [1,245] 25099, [1,246] 110099, [1,247] 110099, [1,248] 110099, [1,249] 25099, [1,251] 65017, [1,256] 150017, [1,257] 150017, [1,258] 150017, [1,259] 65017, [1,261] 66123, [1,266] 161123, [1,267] 161123, [1,268] 161123, [1,269] 161123"},"soporte":"fatapia@scipion.cl","modelo":"MOT","plan_venta":86316060,"funcion_objetivo":26772320}'            
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

        params[:month] = 5
        params[:year] = 2018
        params[:store] = 1
        params[:department] = 1

        month = params[:month].to_i
        year = params[:year].to_i
        store = params[:store].to_i
        department = params[:department].to_i

        #days of the week for this query dias de la semana según comienzo
        @w1_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 1).where(:year => year, store_id: store, department_id: department).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
        @w2_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 2).where(:year => year, store_id: store, department_id: department).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
        @w3_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 3).where(:year => year, store_id: store, department_id: department).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
        @w4_days = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 4).where(:year => year, store_id: store, department_id: department).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}

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
        #binding.pry        
    end
end

