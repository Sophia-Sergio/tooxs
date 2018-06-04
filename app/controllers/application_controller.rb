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
end
