class SalePlansController < ApplicationController
  def index
    @sale_plans = SalePlan.all
    add_breadcrumb 'Dashboard', :root_path
    add_breadcrumb 'Planes de venta', :sale_plans_path
  end

  def import
    if params[:file] != nil
      if SalePlan.from_xlsx(params[:file].tempfile)
        flash[:notice] = 'Importado con éxito'
      else
        flash[:error] = 'Algo ha salido mal, intentalo de nuevo'
      end
    end
    redirect_to sale_plans_url
  end

  def search

    @stores = Store.all
    @search = ''

    week = 44   #replace params later
    year = 2017 #replace params later

    #buscar la semana del query
    #@week_days  = ['mon', 'tue', 'wed', 'thu','fri','sat','sun']

    @dates_week = []
    (1..7).each do |i|
      @dates_week << Date.commercial(year,week,i).strftime('%d-%m-%Y')
    end

    sp_week = SalePlan.where(week:44,store:1, department:1)

    nine         = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }
    ten          = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }
    eleven       = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }
    twelve       = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }
    thirteen     = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }
    fourteen     = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }
    fifteen      = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }
    sixteen      = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }
    seventeen    = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }
    eighteen     = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }
    nineteen     = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }
    twenty       = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }
    twenty_one   = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }
    twenty_two   = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }
    twenty_three = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }
    twenty_four  = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }


    sp_week.each_with_index do |d, i|
      if d.day_number == 0
        d.day_number = 7
      end

      nine[d.day_number] = d.nine
      ten[d.day_number] = d.ten
      eleven[d.day_number] = d.eleven
      twelve[d.day_number] = d.twelve
      thirteen[d.day_number] = d.thirteen
      fourteen[d.day_number] = d.fourteen
      fifteen[d.day_number] = d.fifteen
      sixteen[d.day_number] = d.sixteen
      seventeen[d.day_number] = d.seventeen
      eighteen[d.day_number] = d.eighteen
      nineteen[d.day_number] = d.nineteen
      twenty[d.day_number] = d.twenty
      twenty_one[d.day_number] = d.twenty_one
      twenty_two[d.day_number] = d.twenty_two
      twenty_three[d.day_number] = d.twenty_three
      twenty_four[d.day_number] = d.twenty_four
    end

    @week = {
     '09:00': nine,
     '10:00': ten,
     '11:00': eleven,
     '12:00': twelve,
     '13:00': thirteen,
     '14:00': fourteen,
     '15:00': fifteen,
     '16:00': sixteen,
     '17:00': seventeen,
     '18:00': eighteen,
     '19:00': nineteen,
     '20:00': twenty,
     '21:00': twenty_one,
     '22:00': twenty_two,
     '23:00': twenty_three,
     '00:00': twenty_four
    }
    @total_week = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }

    sp_week.each do |d|
     if d.day_number == 0
        d.day_number = 7
      end

      @total_week[d.day_number] = d.total_day
    end

    #month view

    @sp_month = SalePlan.where(:month => 11, :store => 1, :department => 1).group(:week).order(:week).sum("nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four")
  end


  def json_day
    d = params[:d]
    sp_day = SalePlan.find_by(sale_date: d)


    @day = []
    @day << sp_day.nine
    @day << sp_day.ten
    @day << sp_day.eleven
    @day << sp_day.twelve
    @day << sp_day.thirteen
    @day << sp_day.fourteen
    @day << sp_day.fifteen
    @day << sp_day.sixteen
    @day << sp_day.seventeen
    @day << sp_day.eighteen
    @day << sp_day.nineteen
    @day << sp_day.twenty
    @day << sp_day.twenty_one
    @day << sp_day.twenty_two
    @day << sp_day.twenty_three
    @day << sp_day.twenty_four

    #binding.pry

    hours = []
    (9..24).each do |i|
      hours << "#{i}:00"
    end

    element = [
               { label: 'Plan de Venta', fill: 'false', data: @day, backgroundColor: 'rgb(255, 99, 132)', borderColor: 'rgb(255, 99, 132)'},
               { label: 'Ventas Reales', fill: 'true', data: @day.collect{|n| (n*1.22).to_i}, backgroundColor: 'rgb(153, 102, 255)', borderColor: 'rgb(153, 102, 255)'}
              ]

    @data = { :labels => hours , :datasets => element }

    render json: @data
  end

  def json_week

    week = params[:week].to_i   #replace params later
    year = params[:year].to_i

    @store  = Store.find(params[:store])
    @dep    = Department.find(params[:department])

    @dates_week = []
    (1..7).each do |i|
      @dates_week << Date.commercial(year,week,i).strftime('%d-%m-%Y')
    end



    #incluye toda la semana, independiente si pertenece a otro mes
    sp_week   = SalePlan.where(sale_date: @dates_week[0].to_date..@dates_week[6].to_date, store: @store , department: @dep)

    historic  = HistoricSale.where(week: week , store: @store , department: @dep, year: year-1)
    real      = SaleReal.where(sale_date: @dates_week[0].to_date..@dates_week[6].to_date, store: @store , department: @dep, year: year)


    @total_week = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }

    sp_week.each do |d|
     if d.day_number == 0
        d.day_number = 7
      end

      @total_week[d.day_number] = d.total_day
    end


    #last year
    @total_week_last_year = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }
    historic.each do |d|
     if d.day_number == 0
        d.day_number = 7
      end

      @total_week_last_year[d.day_number] = (d.total_day)
    end


    #real data year

    @total_week_real = { 1 => nil, 2 => nil, 3 => nil, 4 => nil, 5 => nil, 6 => nil, 7 => nil }
    real.each do |d|
     if d.day_number == 0
        d.day_number = 7
      end

      @total_week_real[d.day_number] = (d.total_day)
    end

    #binding.pry



    week_days = ['Lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Domingo']

    elements = [
                { label: 'Plan de Venta', fill: 'false', data: @total_week.values, backgroundColor: 'rgb(255, 99, 132)', borderColor: 'rgb(255, 99, 132)'},
                { label: 'Año Anterior', fill: 'false', data: @total_week_last_year.values, backgroundColor: 'rgb(255, 205, 86)', borderColor: 'rgb(255, 205, 86)'},
                { label: 'Ventas Reales', fill: 'false', data: @total_week_real.values, backgroundColor: 'rgb(153, 102, 255)', borderColor: 'rgb(153, 102, 255)'}
    ]
    @data = { :labels => week_days , :datasets => elements }

    render json: @data
  end

  def json_month

    #binding.pry
    month = params[:month].to_i
    week  = params[:week].to_i   #replace params later
    year  = params[:year].to_i

    @store  = Store.find(params[:store])
    @dep    = Department.find(params[:department])

    beginning_of_month = "#{year}-#{month}-01".to_date
    end_of_month = beginning_of_month.end_of_month

    week_start = beginning_of_month.strftime("%V")
    week_end   = end_of_month.strftime("%V")

    #week fix if is last week of the year on first month
    week_start = '01' if week_start.to_i == 53

    sp_month     = SalePlan.where(week: week_start..week_end, :store => @store, :department => @dep).group(:week).order(:week).sum("nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four")
    historic     = HistoricSale.where(week: week_start..week_end, :store => @store, :department => @dep, :year => year-1).group(:week).order(:week).sum("(nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four)")
    real         = SaleReal.where(week: week_start..week_end, :store => @store, :department => @dep).group(:week).order(:week).sum("(nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four)")

    #binding.pry

    sp_month_last_year = {}
    sp_month_real = {}

    sp_month.each do |k, v|
     sp_month[k] = v.to_i
     sp_month_last_year[k] = historic[k].to_i
     sp_month_real[k] = real[k].to_i
   end


    element = [ { label: 'Plan', fill: 'false', data: sp_month.values.map(&:to_i), backgroundColor: 'rgb(255, 99, 132)', borderColor: 'rgb(255, 99, 132)'},
      { label: 'Historico', fill: 'false', data: sp_month_last_year.values.map(&:to_i), backgroundColor: 'rgb(255, 205, 86)', borderColor: 'rgb(255, 205, 86)'},
      { label: 'Real', fill: 'true', data: sp_month_real.values.map(&:to_i), backgroundColor: 'rgb(153, 102, 255)', borderColor: 'rgb(153, 102, 255)'}
    ]

    @data = { :labels => sp_month.keys.map(&:to_s) , :datasets => element }
    @data = { :labels => [1,2,3,4] , :datasets => element }

    render json: @data
  end

  def json_year

    #binding.pry
    y = params[:y].to_i
    months = ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']

    sp_month            = SalePlan.where(:year => y, :store => 1, :department => 1).group(:month).order(:month).sum("nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four")
    historic            = HistoricSale.where(:year => y-1, :store => 1, :department => 1).group(:month).order(:month).sum("(nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four)")
    real                = SaleReal.where(:year => y, :store => 1, :department => 1).group(:month).order(:month).sum("(nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four)")

    sp_month_last_year = {}
    sp_month_real = {}

    sp_month.each do |k, v|
     sp_month[k] = v.to_i
     sp_month_last_year[k] = historic[k].to_i
     sp_month_real[k] = real[k].to_i
   end


    element = [ { label: 'Plan', fill: 'false', data: sp_month.values.map(&:to_i), backgroundColor: 'rgb(255, 99, 132)', borderColor: 'rgb(255, 99, 132)'},
      { label: 'Historico', fill: 'false', data: sp_month_last_year.values.map(&:to_i), backgroundColor: 'rgb(255, 205, 86)', borderColor: 'rgb(255, 205, 86)'},
      { label: 'Real', fill: 'true', data: sp_month_real.values.map(&:to_i), backgroundColor: 'rgb(153, 102, 255)', borderColor: 'rgb(153, 102, 255)'}
    ]

    @data = { :labels => months.map(&:to_s) , :datasets => element }

    render json: @data
  end

  def delete
    SalePlan.delete_all
    redirect_to sale_plans_url
  end

  def downloads
    send_file(
      "#{Rails.root}/public/plan_ventas_15-07-2018.xlsx",
      filename: "planventas.xlsx",
      type: "application/xlsx"
    )
  end
end

