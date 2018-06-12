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
      @dates_week = []
      dayResult = Array.new(7)
      planResult = Array.new(7)
      (1..7).each do |d|
          @day = AvailableShift.where( num: seller.assigned_shift, week: w, day: d)  
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
          dayResult[d-1] = count
          planResult[d-1] = count.to_i * @depInf.productivity_obj.to_i
      end
      data = { :staffing_per_day => dayResult, :seller_plan_per_day => planResult}
      result << [ w => data ]
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
end
