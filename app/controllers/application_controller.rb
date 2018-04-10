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

end
