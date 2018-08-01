class StaffingController < ApplicationController
  def index

    if params[:department] == nil
      params[:department] = 1
      params[:store] = 1
    end
  
    @month = Date.today.strftime("%m")
    @year  = Date.today.strftime("%Y")
    @store = params[:store].to_i
    @dep   = params[:department].to_i

    #days of the week for this query dias de la semana según comienzo
    @w1_days = SalePlan.where(:month => @month).where(:day_number => [1..7]).where(:week => 1, store_id: @store, department_id: 1).where(:year => @year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
    @w2_days = SalePlan.where(:month => @month).where(:day_number => [1..7]).where(:week => 2, store_id: @store, department_id: 1).where(:year => @year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
    @w3_days = SalePlan.where(:month => @month).where(:day_number => [1..7]).where(:week => 3, store_id: @store, department_id: 1).where(:year => @year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
    @w4_days = SalePlan.where(:month => @month).where(:day_number => [1..7]).where(:week => 4, store_id: @store, department_id: 1).where(:year => @year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}


    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Dotación personal", :staffing_index_path
  	@search       = ''
    @stores       = Store.where(id: 1)
    @departments  = Department.where(:id => [1,5]).order(:id)
    #staffing
    fecha1 = DateTime.parse(@w1_days[0].to_s) 
    fecha1 = fecha1.strftime("%Y%m%d")

    fecha2 = DateTime.parse(@w2_days[0].to_s) 
    fecha2 = fecha2.strftime("%Y%m%d")

    fecha3 = DateTime.parse(@w3_days[0].to_s) 
    fecha3 = fecha3.strftime("%Y%m%d")

    fecha4 = DateTime.parse(@w4_days[0].to_s) 
    fecha4 = fecha4.strftime("%Y%m%d")

    @staffing_w1  = staffing_draw_real(fecha1, @store, @dep)
    @staffing_w2  = staffing_draw_real(fecha2, @store, @dep)
    @staffing_w3  = staffing_draw_real(fecha3, @store, @dep)
    @staffing_w4  = staffing_draw_real(fecha4, @store, @dep)
    #binding.pry
  end

  def staffing_real(store, department)
    days = {}
    daysSet = {}
    date_start  = Date.today.beginning_of_year - 1.year
    date_end    = Date.today.end_of_year + 1.year
    #defino un array con los todos los dias del año

    (date_start..date_end).each do |d|
      #convierto en sym el dia
      day = d.strftime("%Y%m%d").to_sym
      #crea un array desde el 01-01-2017 al 31-12-2019
      days[day] = {:hours => [], :sellers => []}
      daysSet[day] = {}
    end

    days.each do |d, v|
      (9..24).each do |h|
        daysSet[d][h] = {:hours => 0, :sellers => []}
      end
    end


    ##busco los vendedores y veo sus turnos
    sellers = Seller.where(store: store, department: department)

    sellers.each do |s|
      s.my_shift.each do |ms|
        day = ms[0].to_sym

        hours = []
        active_sellers = []
        (ms[1].to_i.. ms[2].to_i).each {|d| hours << d } #cuenta las hora del vendedor recorriendo de la hora de inciio a la de termino
      
        hours.each do |d|
          if d == 0
          else
            daysSet[day][d][:hours] += 1
            daysSet[day][d][:sellers]  << s.fullname
          end
        end
      end
    end

    return daysSet
  end

  def staffing_draw_real(start_date, store, department)

    @staffing = staffing_real(store, department) # tengo las horas en que trabajaron de 9 a 24 y quien es 
    hours = []
    dates = []

    start_date  = start_date.to_s.to_date
    end_date  = start_date + 6.days

    (9..24).each {|h| hours << h }

    (start_date..end_date).each do |d|
      dates << d.strftime("%Y%m%d")
    end

    result = {}

    hours.each_with_index do |h,i|
      result[h.to_s.to_sym] = []
      days = []
      dates.each do |d|
        days << @staffing[d.to_sym][h] 
      end
      result[h.to_s.to_sym] << days
    end

    spd = []

    result.values.each{ |v| spd << v.first.map{|h| h[:hours]}}

    sellers_per_day = spd.transpose.map {|x| x.reduce(:+)}

    week = { :dates => dates, :draw => result, :sellers_per_day => sellers_per_day}

    return week
  end
end