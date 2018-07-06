class SalesController < ApplicationController

  def index
    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Estadísticas de Ventas", :sales_path       
    @search       = ''
            params[:year]  = Date.today.strftime("%Y").to_i
        params[:month] = Date.today.strftime("%m").to_i
    @stores       = Store.all.order(:id)
    @departments  = Department.all.order(:id)
    @seasons      = [ [id: 1, name:'moo'] , [id: 2, name:'lala'] ]
  end

  def quarter
  end

  def week
    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Estadísticas de Ventas", :sales_path  
    add_breadcrumb "Estadísticas de Venta Semanal", :week_sales_path     
    @controller   = 'Venta Semanal'

    @stores       = Store.all.order(:id)
    @departments  = Department.all.order(:id)

    @search       = ''

    @store        = Store.find(params[:store])
    @dep          = Department.find(params[:department])

    @year         = params[:year].to_i    
    @month        = params[:month].to_i
    @week         = params[:week].to_i

    #buscar la semana del query
    dates_week = Sp.where(year: @year, month:@month, week:@week, store: @store, department: @dep).pluck(:date)
    @dates_week = dates_week.map{|x| x.strftime('%d-%m-%Y') }

    @sale_plan_week       = Sp.where(year: @year, month:@month, week:@week, store: @store, department: @dep).pluck(:sale)
    @historic_sale_week   = Hs.where(year: @year - 1, month:@month, week:@week, store: @store, department: @dep).pluck(:total_day)
    @real_sale_week       = Rs.where(year: @year, month:@month, week:@week, store: @store, department: @dep).pluck(:total_day)
    historic_sale_week    = @historic_sale_week

   
    @dif1 =[]
    @dif2 =[]
    @sale_plan_week.each_with_index do |v,i|
      @dif1 << ( (@real_sale_week[i].to_f / v.to_f) -1) * 100
      @dif2 << ( (@real_sale_week[i].to_f / historic_sale_week[i].to_f ) -1) * 100
    end 



	end

  
  def month
    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Estadísticas de Ventas", :sales_path  
    add_breadcrumb "Venta mensual", :month_sales_path  
    
    @controller = 'Venta Mensual'
    @stores     = Store.all.order(:id)
    @departments = Department.all.order(:id)
  	@search = ''
    @compare = 'compare'
    @store  = Store.find(params[:store])
    @dep    = Department.find(params[:department])
    @year  = params[:year].to_i  
    @month = params[:month].to_i


    countWeek = SalePlan.select(:week).distinct.where(year: @year).where(month: @month).where(store_id: @store, department_id: @dep).pluck(:week).length
    real_sale = SaleReal.where(week: 1..countWeek, :store => @store, :department => @dep, year: @year, :month => @month).group(:week).order(:week).sum("(nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four)")
    @historic_sale = SaleReal.where(week: 1..countWeek, :store => @store, :department => @dep, year: @year-1, :month => @month).group(:week).order(:week).sum("(nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four)")

    @sale_plan = []
    historic_sale = []

    (1..countWeek).each do |week|
      @sale_plan << SalePlan.where(year: @year).where(month: @month).where(week: week, store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}.sum
      if @historic_sale[week] == nil
        historic_sale << 0
      else
        historic_sale << @historic_sale[week]
      end
    end

    @dif1 =[]
    @dif2 =[]

    @sale_plan.each_with_index  do |week, index|

      if real_sale[index + 1] == nil
        @dif1 << 0    
      else
        @dif1 << ( (real_sale[index + 1] / week) - 1) * 100
      end      

      if historic_sale[index] == 0 || real_sale[index + 1] == nil
        @dif2 << 0
      else
        @dif2 << ( (real_sale[index + 1] / historic_sale[index] ) -1) * 100
      end

    end

    @real_sale = []
    @keys = []

    (1..countWeek).each do |week|
      if real_sale[week] == nil
        @real_sale << 0
      else
        @real_sale << real_sale[week]
      end
      @keys << week
    end
    
    @historic_sale = historic_sale

    @sum_dif = ((@real_sale.sum / @sale_plan.sum) -1 ) * 100 
    @sum_dif2 = ((@real_sale.sum / @historic_sale.sum) -1 ) * 100 

    #asd
  end

  def json_month

    #binding.pry
    @month = params[:month].to_i
    @week  = params[:week].to_i   #replace params later
    @year  = params[:year].to_i
    
    @store  = Store.find(params[:store])
    @dep    = Department.find(params[:department])


    countWeek = SalePlan.select(:week).distinct.where(year: @year).where(month: @month).where(store_id: @store, department_id: @dep).pluck(:week).length
    real_sale = SaleReal.where(week: 1..countWeek, :store => @store, :department => @dep, year: @year, :month => @month).group(:week).order(:week).sum("(nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four)")
    @historic_sale = SaleReal.where(week: 1..countWeek, :store => @store, :department => @dep, year: @year-1, :month => @month).group(:week).order(:week).sum("(nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four)")

    @sale_plan = []
    historic_sale = []

    (1..countWeek).each do |week|
      @sale_plan << SalePlan.where(year: @year).where(month: @month).where(week: week, store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}.sum
      if @historic_sale[week] == nil
        historic_sale << 0
      else
        historic_sale << @historic_sale[week]
      end
    end

    @dif1 =[]
    @dif2 =[]

    @sale_plan.each_with_index  do |week, index|

      if real_sale[index + 1] == nil
        @dif1 << 0    
      else
        @dif1 << ( (real_sale[index + 1] / week) - 1) * 100
      end      

      if historic_sale[index] == 0 || real_sale[index + 1] == nil
        @dif2 << 0
      else
        @dif2 << ( (real_sale[index + 1] / historic_sale[index] ) -1) * 100
      end

    end

    @real_sale = []
    keys = []
    (1..countWeek).each do |week|
      if real_sale[week] == nil
        @real_sale << 0
      else
        @real_sale << real_sale[week]
      end
      keys << week
    end
    
    @historic_sale = historic_sale


    element = [ 
      { label: 'Real', fill: 'true', data: @real_sale.map(&:to_i), backgroundColor: '#65ff00', borderColor: '#65ff00'},
      { label: 'Meta', fill: 'false', data: @sale_plan.map(&:to_i), backgroundColor: '#33d6ce', borderColor: '#33d6ce'},
      { label: 'Histórico', fill: 'false', data: @historic_sale.map(&:to_i), backgroundColor: '#ff566b', borderColor: '#ff566b'}
    ]

    @data = { :labels => keys.map(&:to_s) , :datasets => element }

    render json: @data
    #binding.pry
  end

  def day
    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Estadísticas de Ventas", :sales_path  
    add_breadcrumb "Estadísticas de Venta Diaria", :day_sales_path     
    @store  = Store.find(1)
    @dep    = Department.find(1)

    @date_search    = params[:d].to_date.strftime("%F")
    @date_historic  = params[:d].to_date - 1.year
    @search = ''

    @current_day = Sp.find_by(store: @store, department: @dep, date: @date_search)

    @sp_hour      = Sp.find_by(store: @store, department: @dep, date: @date_search).to_hour
    @real_day     = Rs.where(store: @store, department: @dep, date: @date_search).pluck(:nine, :ten, :eleven, :twelve, :thirteen, :fourteen, :fifteen, :sixteen, :seventeen, :eighteen, :nineteen, :twenty, :twenty_one, :twenty_two, :twenty_three, :total_day).first
    @historic_day = Hs.where(store: @store, department: @dep, month: @current_day.month, year: @current_day.year.to_i - 1, dow: @current_day.dow, week: @current_day.week).pluck(:nine, :ten, :eleven, :twelve, :thirteen, :fourteen, :fifteen, :sixteen, :seventeen, :eighteen, :nineteen, :twenty, :twenty_one, :twenty_two, :twenty_three, :total_day).first
    historic_day  = @historic_day
    
    #binding.pry

    @dif1 =[]
    @dif2 =[]
    @sp_hour.values.each_with_index do |v,i|
      @dif1 << ( (@real_day[i].to_f / v.to_f) -1) * 100
      @dif2 << ( (@real_day[i].to_f / historic_day[i].to_f ) -1) * 100    
    end
  end

  def old
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
  end

  def year
    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Estadísticas de Ventas", :sales_path  
    add_breadcrumb "Estadística de Venta Anual", :year_sales_path     
    @controller = 'Venta Anual'

    @stores     = Store.all.order(:id)
    @departments = Department.all.order(:id)
    
    @search = ''

    @store  = Store.find(params[:store])
    @dep    = Department.find(params[:department])


    @year  = params[:year].to_i   
    
    @months = ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre']

    @sale_plan_year       = Sp.where(store:@store, department:@dep, year: @year).group(:month).order(:month).sum(:sale);
    @historic_sale_year   = Hs.where(store:@store, department:@dep, year: @year - 1).group(:month).order(:month).sum(:total_day);
    @real_sale_year       = Rs.where(store:@store, department:@dep, year: @year).group(:month).order(:month).sum(:total_day);
    historic_sale_year    = @historic_sale_year

    @dif1 =[]
    @dif2 =[]
    @sale_plan_year.each do |k,v|
      @dif1 << ( (@real_sale_year[k] / v) -1) * 100
      @dif2 << ( (@real_sale_year[k] / historic_sale_year[k] ) -1) * 100
    end  


  end

  def season
    #[19:09, 10/11/2017] Fernando Perez: Otoño - Invierno de Marzo a Agosto
    #[19:09, 10/11/2017] Fernando Perez: Primavera - Verano de Septiembre a febrero

    @sum1 = 0
    @sum2 = 0
    @sum3 = 0

    fall    = [3,4,5,6,7,8]
    spring  = [1,2,9,10,11,12]

    @controller = 'Venta Temporada'

    @seasons  = ['Otoño', 'Primavera']

    @stores     = Store.all.order(:id)
    @departments = Department.all.order(:id)

    @search = ''

    @store  = Store.find(params[:store])
    @dep    = Department.find(params[:department])

    @year  = params[:year].to_i    
    @month = params[:month].to_i

    sum_fall            = SalePlan.where(month: fall, :store => @store, :department => @dep, :year => @year).sum("nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four")
    sum_spring          = SalePlan.where(month: spring, :store => @store, :department => @dep, :year => @year).sum("nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four")
    #   
    sum_fall_historic   = HistoricSale.where(month: fall, :store => @store, :department => @dep, :year => @year-1).sum("nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four")
    sum_spring_historic = HistoricSale.where(month: spring, :store => @store, :department => @dep, :year => @year-1).sum("nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four")

    sum_fall_real       = SaleReal.where(month: fall, :store => @store, :department => @dep, :year => @year).sum("nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four")
    sum_spring_real     = SaleReal.where(month: spring, :store => @store, :department => @dep, :year => @year).sum("nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four")


    #    @real         = SaleReal.where(week: week_start..week_end, :store => @store, :department => @dep).group(:week).order(:week).sum("(nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four)")

    @sp_month     = { fall: sum_fall, spring: sum_spring }
    @historic     = { fall: sum_fall_historic, spring: sum_spring_historic }
    @real         = { fall: sum_fall_real, spring: sum_spring_real }
    historic      = @historic

    @dif1 =[]
    @dif2 =[]
    @sp_month.each do |k,v|
      @dif1 << ( (@real[k] / v) -1) * 100
      @dif2 << ( (@real[k] / historic[k] ) -1) * 100
     end      
    #binding.pry
  end


  def compare_month

    @store  = Store.find(params[:compare][:store]);
    @year   = params[:compare][:year]
    @month  = params[:compare][:month]
    @week   = params[:compare][:week]
    
    #sources
    @store_source = Store.find(params[:compare][:store_source])
    @dep_source   = Department.find(params[:compare][:department_source])

    beginning_of_month = "#{@year}-#{@month}-01".to_date
    end_of_month = beginning_of_month.end_of_month

    week_start = beginning_of_month.strftime("%V")
    week_end   = end_of_month.strftime("%V")

    #week fix if is last week of the year on first month
    week_start = '01' if week_start.to_i == 53  

    @sum1 = 0
    @sum2 = 0

    countWeek = SalePlan.select(:week).distinct.where(year: @year).where(month: @month).where(store_id: @store_source.id, department_id: @dep_source.id).pluck(:week).length
    @real_source = SaleReal.where(week: 1..countWeek, :store => @store_source.id, :department => @dep_source.id, year: @year, :month => @month).group(:week).order(:week).sum("(nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four)")
    @real_vs = SaleReal.where(week: 1..countWeek, :store => @store.id, :department => @dep_source.id, year: @year, :month => @month).group(:week).order(:week).sum("(nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four)")

    @dif1 =[]
    @real_vs.each do |k,v|
      @dif1 << ( (@real_source[k] / v) -1) * 100
    end      

    if @real_vs.values.sum == 0
      @sum_dif = 0
    else
      @sum_dif = (((@real_source.values.sum / @real_vs.values.sum) -1 ) * 100 ).round(2)
    end

    render "sales/compare_month", :layout => false
     
  end

  def compare_month_json

    @store  = Store.find(params[:compare][:store]);
    @year   = params[:compare][:year]
    @month  = params[:compare][:month]
    @week   = params[:compare][:week]
    
    #sources
    @store_source = Store.find(params[:compare][:store_source])
    @dep_source   = Department.find(params[:compare][:department_source])

    beginning_of_month = "#{@year}-#{@month}-01".to_date
    end_of_month = beginning_of_month.end_of_month

    week_start = beginning_of_month.strftime("%V")
    week_end   = end_of_month.strftime("%V")

    #week fix if is last week of the year on first month
    week_start = '01' if week_start.to_i == 53  

    @sum1 = 0
    @sum2 = 0
    countWeek = SalePlan.select(:week).distinct.where(year: @year).where(month: @month).where(store_id: @store_source.id, department_id: @dep_source.id).pluck(:week).length
    @real_source = SaleReal.where(week: 1..countWeek, :store => @store_source.id, :department => @dep_source.id, year: @year, :month => @month).group(:week).order(:week).sum("(nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four)")
    @real_vs = SaleReal.where(week: 1..countWeek, :store => @store.id, :department => @dep_source.id, year: @year, :month => @month).group(:week).order(:week).sum("(nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four)")

    element = [ 
                { label: @store_source.name, fill: 'false', data: @real_source.values.map(&:to_i), backgroundColor: 'rgb(255, 99, 132)', borderColor: 'rgb(255, 99, 132)'},
                { label: @store.name, fill: 'false', data: @real_vs.values.map(&:to_i), backgroundColor: 'rgb(255, 205, 86)', borderColor: 'rgb(255, 205, 86)'},

    ]

    @data = { :labels => @real_source.keys.map(&:to_s) , :datasets => element }

    render json: @data
    
     
  end


  def json_week
    
    @month  = params[:month].to_i
    @week   = params[:week].to_i   #replace params later
    @year   = params[:year].to_i
    
    @store  = Store.find(params[:store])
    @dep    = Department.find(params[:department])

       #buscar la semana del query
    dates_week = Sp.where(year: @year, month:@month, week:@week, store: @store, department: @dep).pluck(:date)
    @dates_week = dates_week.map{|x| x.strftime('%d-%m-%Y') }

    @sale_plan_week       = Sp.where(year: @year, month:@month, week:@week, store: @store, department: @dep).pluck(:sale)
    @historic_sale_week   = Hs.where(year: @year - 1, month:@month, week:@week, store: @store, department: @dep).pluck(:total_day)
    @real_sale_week       = Rs.where(year: @year, month:@month, week:@week, store: @store, department: @dep).pluck(:total_day)

    week_days = ['Lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Domingo']

    elements = [
                { label: 'Plan de Venta', fill: 'false', data: @sale_plan_week, backgroundColor: 'rgb(255, 99, 132)', borderColor: 'rgb(255, 99, 132)'},
                { label: 'Año Anterior', fill: 'false', data: @historic_sale_week, backgroundColor: 'rgb(255, 205, 86)', borderColor: 'rgb(255, 205, 86)'},
                { label: 'Ventas Reales', fill: 'false', data: @real_sale_week, backgroundColor: 'rgb(153, 102, 255)', borderColor: 'rgb(153, 102, 255)'}
    ]
    @data = { :labels => week_days , :datasets => elements }

    render json: @data
  end


  def json_year

    #binding.pry
    @year   = params[:year].to_i
    @month  = params[:month].to_i
    @dep    = params[:department].to_i
    @store  = params[:store].to_i




    months = ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'] 

    sale_plan_year       = Sp.where(store:@store, department:@dep, year: @year).group(:month).order(:month).sum(:sale);
    historic_sale_year   = Hs.where(store:@store, department:@dep, year: @year - 1).group(:month).order(:month).sum(:total_day);
    real_sale_year       = Rs.where(store:@store, department:@dep, year: @year).group(:month).order(:month).sum(:total_day);


    element = [ { label: 'Plan', fill: 'false', data: sale_plan_year.values.map(&:to_i), backgroundColor: 'rgb(255, 99, 132)', borderColor: 'rgb(255, 99, 132)'},
      { label: 'Historico', fill: 'false', data: historic_sale_year.values.map(&:to_i), backgroundColor: 'rgb(255, 205, 86)', borderColor: 'rgb(255, 205, 86)'},
      { label: 'Real', fill: 'true', data: real_sale_year.values.map(&:to_i), backgroundColor: 'rgb(153, 102, 255)', borderColor: 'rgb(153, 102, 255)'}
    ]

    @data = { :labels => months.map(&:to_s) , :datasets => element }

    render json: @data
  end

  def json_day
    @date_search = params[:d]
    @store = 1
    @dep = 1
    
    @current_day = Sp.find_by(date: @date_search)

    @sp_hour      = Sp.find_by(store: @store, department: @dep, date: @date_search).to_hour
    @real_day     = Rs.where(store: @store, department: @dep, date: @date_search).pluck(:nine, :ten, :eleven, :twelve, :thirteen, :fourteen, :fifteen, :sixteen, :seventeen, :eighteen, :nineteen, :twenty, :twenty_one, :twenty_two, :twenty_three ).first
    @historic_day = Hs.where(store: @store, department: @dep, month: @current_day.month, year: @current_day.year.to_i - 1, dow: @current_day.dow, week: @current_day.week).pluck(:nine, :ten, :eleven, :twelve, :thirteen, :fourteen, :fifteen, :sixteen, :seventeen, :eighteen, :nineteen, :twenty, :twenty_one, :twenty_two, :twenty_three).first

    @sp_hour.delete(:total)

    hours = []
    (9..23).each do |i|
      hours << "#{i}:00"    
    end

    element = [
               { label: 'Plan de Venta', fill: 'false', data: @sp_hour.values, backgroundColor: 'rgb(255, 99, 132)', borderColor: 'rgb(255, 99, 132)'},
               { label: 'Ventas Reales', fill: 'true', data: @real_day, backgroundColor: 'rgb(153, 102, 255)', borderColor: 'rgb(153, 102, 255)'}
              ]

    @data = { :labels => hours , :datasets => element }

    render json: @data
  end



end

