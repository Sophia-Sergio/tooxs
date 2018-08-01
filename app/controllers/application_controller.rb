class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  if Rails.env.production?
    http_basic_authenticate_with name: "salesforce", password: "12345678"
  end

  def staffing

  	days = {}
  	date_start  = Date.today.beginning_of_year - 1.year
  	date_end    = Date.today.end_of_year + 1.year
      #defino un array con los todos los dias del año

      (date_start..date_end).each do |d|
        #convierto en sym el dia
        day = d.strftime("%Y%m%d").to_sym
        #crea un array desde el 01-01-2017 al 31-12-2019
        days[day] = {:hours => [], :sellers => []}

    end

      ##busco los vendedores y veo sus turnos
      sellers = Seller.where(store: 1, department: 1)

      sellers.each do |s|
      	s.my_shift.each do |ms|
      		day = ms[0].to_sym

      		hours = []
      		active_sellers = []
      		(ms[1].to_i.. ms[2].to_i).each {|d| hours << d }

          binding.pry if days[day].nil?
          days[day][:hours] << hours
          days[day][:sellers]  << s.fullname
      end

  end


  days    = days.each { |k,v| days[k][:hours] = v[:hours].flatten }
  result  = days.each { |k,v| days[k][:hours] = v[:hours].inject(Hash.new(0)) { |h, e| h[e] += 1 ; h }}

end

	def staffing_draw(start_date)

		@staffing = staffing
		hours = []
		dates = []

		start_date 	= start_date.to_s.to_date
		end_date	= start_date + 6.days

    day_hours = [
        :nine,
        :ten,
        :eleven,
        :twelve,
        :thirteen,
        :fourteen,
        :fifteen,
        :sixteen,
        :seventeen,
        :eighteen,
        :nineteen,
        :twenty,
        :twenty_one,
        :twenty_two,
        :twenty_three,
      ]

		(9..24).each {|h| hours << h }

    #day_hours.each {|h| hours << h.second }

		(start_date..end_date).each do |d|
			dates << d.strftime("%Y%m%d")
		end

    #binding.pry

		result = {}

		hours.each_with_index do |h,i|
      result[h.to_s.to_sym] = []
			#result[h] = []
			days = []

			dates.each do |d|
				days << @staffing[d.to_sym][:hours][h]
			end

      #result[h.to_s.to_sym] << days
			result[h.to_s.to_sym] << days
		end


    spd = []

    result.values.each{ |v| spd << v.first }
    sellers_per_day = spd.transpose.map {|x| x.reduce(:+)}

		week = { :dates => dates, :draw => result, :sellers_per_day => sellers_per_day}
		
		#binding.pry
		return week

	end

  def seller_staffing(seller, month, year)

    @store        = seller.store.id
    @dep          = seller.department.id
    @year         = year
    @month        = month

    @depInf = Department.find(@dep)
   
    @depInf.productivity_obj
      
    result = []  
    (1..4).each do |w|
      @week = w
      @dates_week = []
      dayResult = Array.new(7)
      planResult = Array.new(7)
      (1..7).each do |d|
          #recorrer todos los turnos
          @days = AvailableShift.where(week: @week, day: d)  
          countAll = 0 
          @days.each do |s|
            countAll += 1 if s.nine
            countAll += 1 if s.ten
            countAll += 1 if s.eleven
            countAll += 1 if s.twelve
            countAll += 1 if s.thirteen
            countAll += 1 if s.fourteen
            countAll += 1 if s.fifteen
            countAll += 1 if s.sixteen
            countAll += 1 if s.seventeen
            countAll += 1 if s.eighteen
            countAll += 1 if s.nineteen
            countAll += 1 if s.twenty
            countAll += 1 if s.twenty_one
            countAll += 1 if s.twenty_two
            countAll += 1 if s.twenty_three
            countAll += 1 if s.twenty_four
          end
          

          @day = AvailableShift.where( num: seller.assigned_shift, week: @week, day: d)  
          count = 0 
          @day.each do |s|
            count += 1 if s.nine
            count += 1 if s.ten
            count += 1 if s.eleven
            count += 1 if s.twelve
            count += 1 if s.thirteen
            count += 1 if s.fourteen
            count += 1 if s.fifteen
            count += 1 if s.sixteen
            count += 1 if s.seventeen
            count += 1 if s.eighteen
            count += 1 if s.nineteen
            count += 1 if s.twenty
            count += 1 if s.twenty_one
            count += 1 if s.twenty_two
            count += 1 if s.twenty_three
            count += 1 if s.twenty_four
          end

          @sp_m1 = SalePlan.where(year: @year).where(month: @month, store_id: @store, department_id: @dep, week: @week, day_number: d).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}
          dayResult[d-1] = count
          planResult[d-1] = count.to_i * (@sp_m1.first.to_i / countAll.to_i) #@depInf.productivity_obj.to_i
      end
      data = { :staffing_per_day => dayResult, :seller_plan_per_day => planResult}
      result << [ @week => data ]
    end  
    return result   
  end

    def setNum(num)
      num_parse = ActiveSupport::NumberHelper::number_to_currency(num, { delimiter: "." })
      return num_parse
    end

    def brain_json(month, year, store, department)

        month = month.to_i
        year = year.to_i
        store = store.to_i
        department = department.to_i

        #[1,hora 10,dia 28,1]       
        m1 = SalePlan.where(month: month, year: year).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}

        w1 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 1, store_id: store, department_id: department).where(:year => year).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}
        w2 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 2, store_id: store, department_id: department).where(:year => year).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}
        w3 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 3, store_id: store, department_id: department).where(:year => year).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}
        w4 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 4, store_id: store, department_id: department).where(:year => year).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}
        w5 = SalePlan.where(:month => month).where(:day_number => [1..7]).where(:week => 5, store_id: store, department_id: department).where(:year => year).where(:day_number => 1).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%Y%m%d').to_sym}


        staffingM1 = staffing_draw(w1)[:sellers_per_day] + staffing_draw(w2)[:sellers_per_day] + staffing_draw(w3)[:sellers_per_day] + staffing_draw(w4)[:sellers_per_day]

        if w5.length > 0
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

    def calculo_semanal(datos, dias)
      semanasCount = 0
      diasCount = 1
      arraySemana = []

      for i in 0..datos.length - 1 

        if arraySemana[semanasCount] == nil
          arraySemana[semanasCount] = 0
        end

        arraySemana[semanasCount] += datos[i].to_i

        if diasCount < dias
          diasCount += 1
        else
          diasCount = 1
          semanasCount += 1
        end
      end
      return arraySemana
    end
    def cerebro_plan_venta_opt(plan)

      if plan.length != 0 
        plan = JSON.parse(plan)
        plan_venta_in = plan["datos"]["plan_venta"].to_s.split(", [")
        plan_venta_in[0] = plan_venta_in[0].gsub("[", "")
        num_horas_dia_in =  plan["datos"]["num_horas_dia"].to_i
        num_dias_ventana = plan["datos"]["num_dias_ventana"].to_i

        #sacar el plan de venta diario
        plan_venta_diario = Array.new(num_dias_ventana) { |i| i = 0 }
        #inicializar en 0
        for i in 0..plan_venta_in.length-1 
          plan_hora = plan_venta_in[i].to_s.split("] ")
          plan_venta_diario[(plan_hora[0].to_s.split(",")[2]).to_i-1] = 0;
        end

        #sumatoria por día 
        for i in 0..plan_venta_in.length-1 
          plan_hora = plan_venta_in[i].to_s.split("] ")
          plan_venta_diario[(plan_hora[0].to_s.split(",")[2]).to_i-1] += plan_hora[1].to_f
        end

        for i in 0..plan_venta_diario.length-1 
          plan_venta_diario[i] =  (plan_venta_diario[i].to_i).round
        end
      else
        plan_venta_in = ""
      end
      return plan_venta_diario
    end
    def total_turnos(plan, dotacion)
      if plan.length != 0           
        matriz_turnos = plan["datos"]["matriz_turnos"].to_s.split(", [")
        matriz_turnos[0] = matriz_turnos[0].gsub("[", "")
        num_turnos = plan["datos"]["num_turnos"]

        matriz_turnos_in = []

        for i in 0..matriz_turnos.length-1
          turno = matriz_turnos[i].to_s.split("] ")[0]
          turno_1 = matriz_turnos[i].to_s.split("] ")[1]
          coordenadas = turno.to_s.split(",")
          matriz_turnos_in[i] = { :turno => coordenadas[0], :hora => coordenadas[1], :dia => coordenadas[2] , :valor => (turno_1).to_f}
        end


        #//////////////// dotacion real //////////////////////////////////

        dotacion_real = dotacion
        dotacion_real[0] = dotacion_real[0].gsub("[", "")

        matriz_dotacion_real = []

        for i in 0..dotacion_real.length-1
          dotacion = dotacion_real[i].to_s.split("] ")[0]
          dotacion_cantidad = dotacion_real[i].to_s.split("] ")[1]
          coordenadas = dotacion.to_s.split(",")
          matriz_dotacion_real[i] = {:turno => coordenadas[0], :x => coordenadas[1], :y => coordenadas[2], :cantidad => dotacion_cantidad}
        end

        #//////////////////////////////////////////////////////////////////
        #// sumatoria de turnos real para imprimir en la gráfica
        #//////////////////////////////////////////////////////////////////

        dia = 0 #// maximo  plan.datos.num_dias_ventana
        hora = 0 #// máximo plan.datos.num_horas_dia

        sumatoria_turnos_real = Array.new((plan["datos"]["num_dias_ventana"] * plan["datos"]["num_horas_dia"]).to_i) { |i| i = 0 }

        for i in 0..matriz_turnos_in.length-1
          hora_turno = matriz_turnos_in[i]
          coordenada = ((hora_turno[:dia].to_i-1) * 10 + (hora_turno[:hora]).to_i) - 1

          for j in 0..matriz_dotacion_real.length-1
            if matriz_dotacion_real[j][:turno] == matriz_turnos_in[i][:turno]            
              sumatoria_turnos_real[coordenada] += (matriz_dotacion_real[j][:cantidad] ).to_f
            end
          end
        end
        #/////////////////////////////////////////////////////////////////
      else
        sumatoria_turnos_real = ""
      end 
      return sumatoria_turnos_real      
    end
    def cerebro_sumatoria_turnos_diaria(plan)
      if plan.length != 0 
        plan = JSON.parse(plan)
        num_dias_ventana = plan["datos"]["num_dias_ventana"].to_i
        turnosSumatoria = Array.new(num_dias_ventana) { |i| i = 0 }

        dotacion = plan["datos"]["dotacion_real"].to_s.split(", [")

        totalTurnosReales = total_turnos(plan, dotacion)
        diaSemana = 1
        horasDiarias = 10
        num_horas_dia_in = plan["datos"]["num_horas_dia"]
        count = 1;
        diaMes = 0;

        countDia = 1;

        for i in 0..turnosSumatoria.length-1 
          turnosSumatoria[i] = 0
        end

        for i in 0..totalTurnosReales.length-1 
          turnosSumatoria[diaMes] += (totalTurnosReales[i]).to_i
          if countDia < num_horas_dia_in
            countDia += 1
          else
            countDia = 1
            diaMes += 1
          end
        end
      else
        turnosSumatoria = ""
      end

      return turnosSumatoria
    end

    def cerebro_sumatoria_turnos_optimizado(plan, id_case)
      if plan.length != 0 
        plan = JSON.parse(plan)
        num_dias_ventana = plan["datos"]["num_dias_ventana"].to_i
        turnosSumatoria = Array.new(num_dias_ventana) { |i| i = 0 }


        # calcular turnos cubiertos
        summaryCase = SummaryCase.where(id_case: id_case, type_io: "out").first  
        opt_turn = summaryCase.real_dot.tr('{', '').tr(' ','').tr('}', '').split(%r{,\s*})
        turnosOptimizados = Array.new(12, 0)

        opt_turn.each do |turn|
          turn = turn.split(":")
          turnosOptimizados[turn[0].to_i-1] = turn[1].to_i
        end

        count = 1
        dotacion = [] 
        turnosOptimizados.each do |turno|
          dotacion << "#{count},1,1] #{turno}"
          count += 1
        end

        totalTurnosReales = total_turnos(plan, dotacion)

        diaSemana = 1
        horasDiarias = 10
        num_horas_dia_in = plan["datos"]["num_horas_dia"]
        count = 1;
        diaMes = 0;

        countDia = 1;

        for i in 0..turnosSumatoria.length-1 
          turnosSumatoria[i] = 0
        end

        for i in 0..totalTurnosReales.length-1 
          turnosSumatoria[diaMes] += (totalTurnosReales[i]).to_i
          if countDia < num_horas_dia_in
            countDia += 1
          else
            countDia = 1
            diaMes += 1
          end
        end
      else
        turnosSumatoria = ""
      end

      return turnosSumatoria
    end

    def cerebro_calculo_productividades_week(plan, dotacion)


      prod_week = []

      (0..plan.length-1).each do |i|
        if dotacion[i] == nil 
          prod_week << (plan[i].to_f / dotacion[0].to_f).round
        else
          prod_week << (plan[i].to_f / dotacion[i].to_f).round
        end    
      end
      return prod_week
    end
    def dotacion_real
      dotReal = []
      dotReal[1] = [78, 109, 145, 148, 145, 76, 79, 113, 131, 34, 117, 127, 155, 128, 138, 68, 154, 99, 99, 157, 112, 82, 32, 154, 63, 127, 162, 128]
      dotReal[2] = [90, 125, 160, 164, 161, 76, 85, 126, 144, 40, 130, 141, 163, 142, 154, 74, 170, 114, 114, 166, 118, 88, 38, 170, 69, 141, 171, 142]
      dotReal[3] = [78, 109, 145, 148, 145, 76, 79, 113, 131, 34, 117, 127, 155, 128, 138, 68, 154, 99, 99, 157, 112, 82, 32, 154, 63, 127, 162, 128,78, 109, 145, 148, 145, 76, 79]
      dotReal[4] = [78, 109, 145, 148, 145, 76, 79, 113, 131, 34, 117, 127, 155, 128, 138, 68, 154, 99, 99, 157, 112, 82, 32, 154, 63, 127, 162, 128]
      dotReal[5] = [78, 109, 145, 148, 145, 76, 79, 113, 131, 34, 117, 127, 155, 128, 138, 68, 154, 99, 99, 157, 112, 82, 32, 154, 63, 127, 162, 128]
      dotReal[6] = [78, 109, 145, 148, 145, 76, 79, 113, 131, 34, 117, 127, 155, 128, 138, 68, 154, 99, 99, 157, 112, 82, 32, 154, 63, 127, 162, 128]
      dotReal[7] = []
      dotReal[8] = []
      return dotReal
    end
    def day_now(year, month)

      @year         = year #params[:year]    
      @month        = month #params[:month] 

      beginning_of_month = "#{@year}-#{@month}-01".to_date
      end_of_month = beginning_of_month.end_of_month

      week_start = beginning_of_month.strftime("%V")
      week_end   = end_of_month.strftime("%V")

      result = []
      day = Array.new(7)
      week_total = week_end.to_i - week_start.to_i;
      weekSet = 1

      (week_start..week_end).each do |w|
        dayCount = 0
        @week = w
        @dates_week = []
        day = Array.new(7)

        (1..7).each do |d|
          @dates_week << Date.commercial(@year.to_i,@week.to_i,d).strftime('%d-%m-%Y')
          if Date.today.strftime('%d-%m-%Y').to_s == Date.commercial(@year.to_i,@week.to_i,d).strftime('%d-%m-%Y')
            result = { :day => d, :week => weekSet }
          end
        end
        weekSet += 1 
      end
      return result
    end

    def day_now_charged
      lastSale = SaleBySeller.last(1)
      result = { :day => lastSale.first.day, :week => lastSale.first.week }
      return result
    end
end
