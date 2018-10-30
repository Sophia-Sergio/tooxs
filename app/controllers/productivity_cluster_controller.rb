class ProductivityClusterController < ApplicationController

  before_action :set_stores, only: %i[month json_month]

  def index
    @search       = ''
    @clusters     = Cluster.all.order(:id)
    @departments  = Department.distinct.pluck(:name)
    @masterDepartments = MasterDepartment.all.order(:id)
    @month = Date.today.strftime("%m").to_i
  end

  def month
    @search       = ''
    @clusters     = Cluster.all.order(:id)
    @departments  = Department.distinct.pluck(:name)
    @masterDepartments = MasterDepartment.all.order(:id)
    @masterDeparment   = MasterDepartment.find(params[:department])

    @cluster_name =  Cluster.find(params[:cluster]).name
    @year  = params[:year].to_i
    @month = params[:month].to_i


    @elements = element(@month, @week, @year, @stores, @dep)
    #calcular ventas reales por semana

    @resultStore = []

    @elements.each do |element|
      #calcular total por semana
      saleWeek = []
      count = 0
      week  = 0
      saleWeek[week] = 0
      element[:realMonth].each do |data|
        if count > 6
            week += 1
            count = 0
            saleWeek[week] = 0
        end
        saleWeek[week] += data.to_i
        count += 1
      end

      #calcular dotacion por semana
      dotWeek = []
      count = 0
      week  = 0
      dotWeek[week] = 0
      element[:dotMonth].each do |data|
        if count > 6
            week += 1
            count = 0
            dotWeek[week] = 0
        end
        dotWeek[week] += data.to_i
        count += 1
      end

      #calcular productividad por semana
      prodWeek = []
      (0..week).each do |count|
        prodWeek[count] = (saleWeek[count].to_f/ dotWeek[count].to_f).round(2)
      end
      @resultStore << { :label =>  element[:label], :prodWeek => prodWeek}
    end
  end

  def json_month
    @month = params[:month].to_i
    @week  = params[:week].to_i   #replace params later
    @year  = params[:year].to_i

    @dep    = Department.find(params[:department])


    beginning_of_month = "#{@year}-#{@month}-01".to_date
    end_of_month = beginning_of_month.end_of_month

    month_start = beginning_of_month.strftime("%d").to_i
    month_end   = end_of_month.strftime("%d").to_i

    #generar element
    element = element(@month, @week, @year, @stores, @dep)

    labels = []

    countWeek = SalePlan.select(:week).distinct.where(year: @year).where(month: @month).where(store_id: @stores.first, department_id: @dep).pluck(:week).length
    @m_days = SalePlan.where(:month => @month).where(:day_number => [1..7]).where(:week => [1..countWeek], store_id: @stores.first, department_id: @dep).where(:year => @year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d').to_sym}

    @data = { :labels => @m_days.reverse, :datasets => element }
    render json: @data
  end

  def element(month, week, year, stores, dep)
    departments = []
    element = []

    colors = []
    colorCount = 0

    colors << 'rgb(255, 205, 86)'
    colors << 'rgb(153, 102, 255)'

    beginning_of_month = "#{@year}-#{@month}-01".to_date
    end_of_month = beginning_of_month.end_of_month

    month_start = beginning_of_month.strftime("%d").to_i
    month_end   = end_of_month.strftime("%d").to_i

    #obtener departamentos
    @stores.each do |store|
      departments << Department.where(store: store[:id], master_id: params[:department])
    end

    #obtener valores
    departments.each do |department|
      if department.length > 0
        sale_reals = SaleReal.where(department_id: department.first[:master_id], store_id: department.first[:store_id], year: @year, month: @month)
        totalMonth = []
        realMonth = []
        dotMonth = []

        dotReal = dotacion_real(department, @month, @year)

        countReal = 0
        sale_reals.each do |sale|
          totalRealDay = sale[:nine]+sale[:ten]+sale[:eleven]+sale[:twelve]+sale[:thirteen]+sale[:fourteen]+sale[:fifteen]+sale[:sixteen]+sale[:seventeen]+sale[:eighteen]+sale[:nineteen]+sale[:twenty]+sale[:twenty_one]+sale[:twenty_two]+sale[:twenty_three]+sale[:twenty_four]
          totalDotDay = dotReal[countReal]
          realMonth  << totalRealDay
          dotMonth   << totalDotDay
          if dotReal[countReal] == nil
          else
            totalMonth << (totalRealDay.to_f / dotReal[countReal].to_f).round
          end
          countReal += 1
        end
        store = Store.find(department.first[:store_id])
        #calcular total por semana
        saleWeek = []
        count = 0
        week  = 0
        saleWeek[week] = 0

        realMonth.each do |data|
          if count > 6
            week += 1
            count = 0
            saleWeek[week] = 0
          end
          saleWeek[week] += data.to_i
          count += 1
        end
        #calcular dotacion por semana
        dotWeek = []
        count = 0
        week  = 0
        dotWeek[week] = 0

        dotMonth.each do |data|
          if count > 6
              week += 1
              count = 0
              dotWeek[week] = 0
          end
          dotWeek[week] += data.to_i
          count += 1
        end

        #calcular productividad por semana
        prodWeek = []

        (0..week).each do |count|
          prodWeek[count] = (saleWeek[count].to_f/ dotWeek[count].to_f).round(2)
        end

        element << { label: store[:name], fill: 'false', data: totalMonth, totalMonth: totalMonth.map(&:to_s), realMonth: realMonth, dotMonth: dotMonth, backgroundColor: colors[colorCount], borderColor: colors[colorCount]}
        colorCount += 1
      end
    end
    return element
  end

  private

  def set_stores
    @stores = Store.by_cluster(params[:cluster])
  end
end
