module ProductivityHelper

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

	def brain_json()

		month = params[:month].to_i
		year = params[:year].to_i
		store = params[:store].to_i
		department = params[:department].to_i

		#[1,hora 10,dia 28,1]
		
		m1 = Sp.where(month: month, year: year).pluck(:sale)
	    w1 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 1).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
	    w2 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 2).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
	    w3 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 3).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
	    w4 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 4).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}

		staffingM1 = staffing_draw(w1)[:sellers_per_day] + staffing_draw(w2)[:sellers_per_day] + staffing_draw(w3)[:sellers_per_day] + staffing_draw(w4)[:sellers_per_day]
		plan_venta_set = ""
		day = 0
		m1.each do |r|
			10.times do |i| 
				plan_venta_set += " [1,#{i + 1},#{day + 1},1] #{(r/staffingM1[day]).to_i},"
			end
			day += 1
		end
		plan_venta_set = plan_venta_set.slice 1 .. -2
		case_api = 23
		staffingCase = StaffingCase.where(id_case: case_api.to_i).first
		dataCase = DataCase.where(id_case: case_api.to_i).first 

		json_code = { "accion": "ejecutar", 
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
				"plan_venta": plan_venta_set.to_s
			}
		}.to_json
		return json_code
	end
end
