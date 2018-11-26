class SalesController < ApplicationController
  include DemoParameters

  def index
    @search       = ''
    @stores       = Store.all.order(:id)
    @departments  = Department.all.order(:id)
    @seasons      = [[id: 1, name: 'moo'], [id: 2, name: 'lala']]
  end

  def month
    @controller = 'Venta Mensual'
    department = params[:department] || demo_data[:department]
    store = params[:store] || demo_data[:store]
    cluster = params[:cluster] || demo_data[:cluster]
    @year  = params[:year] || demo_data[:year]
    @month = params[:month] || demo_data[:month]
    @stores     = Store.where(:id => [1, 2]).order(:id)
    @departments = Department.where(:id => [1,5]).order(:id)
  	@search = ''
    @compare = 'compare'
    @store  = Store.find(store)
    @dep    = Department.find(department)
    countWeek = SalePlan.select(:week).distinct.where(year: @year).where(month: @month).where(store_id: @store.id, department_id: @dep.id).pluck(:week).length

    real_sale = SaleReal.where(week: 1..countWeek, :store => @store, :department => @dep, year: @year, :month => @month).group(:week).order(:week).sum("(nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four)")
    @historic_sale = SaleReal.where(week: 1..countWeek, :store => @store, :department => @dep, year: @year.to_i-1, :month => @month).group(:week).order(:week).sum("(nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four)")

    @sale_plan = []
    historic_sale = []

    (1..countWeek).each do |week|
      @sale_plan << SalePlan.where(year: @year).where(month: @month).where(week: week, store_id: @store.id, department_id: @dep.id).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}.sum
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

    if   @sale_plan.length > 0
      @sum_dif = ((@real_sale.sum / @sale_plan.sum) -1 ) * 100
    end

    if @historic_sale.sum > 0
      @sum_dif2 = ((@real_sale.sum / @historic_sale.sum) -1 ) * 100
    end

    @m_days = SalePlan.where(:month => @month).where(:day_number => [1..7]).where(:week => [1..countWeek], store_id: @store.id, department_id: @dep.id).where(:year => @year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m').to_sym}

  end

  def json_month
    @month = params[:month].to_i
    @week  = params[:week].to_i   #replace params later
    @year  = params[:year].to_i

    @store  = Store.find(params[:store])
    @dep    = Department.find(params[:department])

    countWeek = SalePlan.select(:week).distinct.where(year: @year).where(month: @month).where(store_id: @store, department_id: @dep).pluck(:week).length

    #days of the week for this query
    @m_days = SalePlan.where(:month => @month).where(:day_number => [1..7]).where(:week => [1..countWeek], store_id: @store, department_id: @dep).where(:year => @year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d').to_sym}
    @m_daily = SalePlan.where(year: @year, month: @month, week: [1..countWeek], store_id: @store, department_id: @dep).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}
    sale_reals = SaleReal.where(department_id: @dep, store_id: @store, year: @year, month: @month)

    @realMonth = []
    sale_reals.each do |sale|
      totalRealDay = sale[:nine]+sale[:ten]+sale[:eleven]+sale[:twelve]+sale[:thirteen]+sale[:fourteen]+sale[:fifteen]+sale[:sixteen]+sale[:seventeen]+sale[:eighteen]+sale[:nineteen]+sale[:twenty]+sale[:twenty_one]+sale[:twenty_two]+sale[:twenty_three]+sale[:twenty_four]
      @realMonth  << totalRealDay
    end

    sale_reals_h = SaleReal.where(department_id: @dep, store_id: @store, year: @year-1, month: @month)

    @realMonth_h = []
    sale_reals_h.each do |sale|
      totalRealDay = sale[:nine]+sale[:ten]+sale[:eleven]+sale[:twelve]+sale[:thirteen]+sale[:fourteen]+sale[:fifteen]+sale[:sixteen]+sale[:seventeen]+sale[:eighteen]+sale[:nineteen]+sale[:twenty]+sale[:twenty_one]+sale[:twenty_two]+sale[:twenty_three]+sale[:twenty_four]
      @realMonth_h  << totalRealDay
    end

    element = [
      { label: 'Real', fill: 'true', data: @realMonth, backgroundColor: '#65ff00', borderColor: '#65ff00'},
      { label: 'Plan', fill: 'false', data: @m_daily.reverse, backgroundColor: '#33d6ce', borderColor: '#33d6ce'},
      { label: 'Histórico', fill: 'false', data: @realMonth_h, backgroundColor: '#ff566b', borderColor: '#ff566b'}
    ]

    @data = { :labels => @m_days.reverse , :datasets => element }

    render json: @data
  end

  def compare_month

    @store  = Store.find(params[:compare][:store]);
    @year   = 2018
    @month  = 5
    @week   = params[:compare][:week]

    #sources
    @store_source = Store.find(1)
    @dep_source   = Department.find(1)

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

    @store  = Store.find(2)
    @year   = 2018
    @month  = 5
    @week   = params[:compare][:week]

    #sources
    @store_source = Store.find(1)
    @dep_source   = Department.find(1)

    beginning_of_month = "#{@year}-#{@month}-01".to_date
    end_of_month = beginning_of_month.end_of_month

    week_start = beginning_of_month.strftime("%V")
    week_end   = end_of_month.strftime("%V")

    #week fix if is last week of the year on first month
    week_start = '01' if week_start.to_i == 53

    @sum1 = 0
    @sum2 = 0
    countWeek = SalePlan.select(:week).distinct.where(year: @year).where(month: @month).where(store_id: @store_source.id, department_id: @dep_source.id).pluck(:week).length
    @real_source = SaleReal.where(week: 1..countWeek, :store => @store_source.id, :department => @dep_source.id, year: @year, :month => @month).sum("(nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four)")
    @real_vs = SaleReal.where(week: 1..countWeek, :store => @store.id, :department => @dep_source.id, year: @year, :month => @month).sum("(nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four)")

    @m_days = SalePlan.where(:month => @month).where(:day_number => [1..7]).where(:week => [1..countWeek], store_id: @store_source.id, department_id: @dep_source.id).where(:year => @year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d').to_sym}

    sale_reals = SaleReal.where(department_id: @dep_source.id, store_id: @store_source.id, year: @year, month: @month)
    @realMonth = []
    sale_reals.each do |sale|
      totalRealDay = sale[:nine]+sale[:ten]+sale[:eleven]+sale[:twelve]+sale[:thirteen]+sale[:fourteen]+sale[:fifteen]+sale[:sixteen]+sale[:seventeen]+sale[:eighteen]+sale[:nineteen]+sale[:twenty]+sale[:twenty_one]+sale[:twenty_two]+sale[:twenty_three]+sale[:twenty_four]
      @realMonth  << totalRealDay
    end

    sale_reals_vs = SaleReal.where(department_id: @dep_source.id, store_id: @store.id, year: @year, month: @month)

    @realMonth_vs = []
    sale_reals_vs.each do |sale|
      totalRealDay = sale[:nine]+sale[:ten]+sale[:eleven]+sale[:twelve]+sale[:thirteen]+sale[:fourteen]+sale[:fifteen]+sale[:sixteen]+sale[:seventeen]+sale[:eighteen]+sale[:nineteen]+sale[:twenty]+sale[:twenty_one]+sale[:twenty_two]+sale[:twenty_three]+sale[:twenty_four]
      @realMonth_vs  << totalRealDay
    end
    element = [
                { label: @store_source.name, fill: 'false', data: @realMonth, backgroundColor: 'rgb(255, 99, 132)', borderColor: 'rgb(255, 99, 132)'},
                { label: @store.name, fill: 'false', data: @realMonth_vs, backgroundColor: 'rgb(255, 205, 86)', borderColor: 'rgb(255, 205, 86)'},

    ]

    @data = { :labels => @m_days.reverse , :datasets => element }

    render json: @data
  end
end

