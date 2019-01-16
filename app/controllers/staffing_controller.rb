class StaffingController < ApplicationController
  # include FilterParameters
  # skip_before_action :verify_authenticity_token
  # before_action :set_params, only: %i[index]
  # before_action :set_store, only: %i[index]
  # before_action :set_department, only: %i[index]

  def index
    # sale_plans = @store.sale_plans.by_year_and_month(@year, @month)
    #                    .by_department(@department)
    # dates_by_week = sale_plans.dates_by_week(day_number = 1)
    # @staffing_w1  = staffing_draw_real(dates_by_week[1], @store, @department)
    # @staffing_w2  = staffing_draw_real(dates_by_week[2], @store, @department)
    # @staffing_w3  = staffing_draw_real(dates_by_week[3], @store, @department)
    # @staffing_w4  = staffing_draw_real(dates_by_week[4], @store, @department)
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