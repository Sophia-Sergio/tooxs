class SalesClusterController < ApplicationController
  include DemoParameters

  def index
    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Ventas por Segmento", :sales_cluster_index_path
    @search       = ''
    @clusters     = Cluster.where(id: 1)
    @masterDepartments = MasterDepartment.where(id: 1)
    @month = Date.today.strftime("%m").to_i
  end

  def month
    @search       = ''
    department = params[:department] || demo_data[:department]
    cluster = params[:cluster] || demo_data[:cluster]
    @year  = params[:year] || demo_data[:year]
    @month = params[:month] || demo_data[:month]

    @stores      = Store.by_cluster(cluster)
    @clusters     = Cluster.all.order(:id)
    @departments  = Department.distinct.pluck(:name)
    @masterDepartments = MasterDepartment.all.order(:id)
    @masterDeparment   = MasterDepartment.find(department)
    @dep = Department.find(department)
    @cluster_name =  Cluster.find(cluster).name
    @elements = element(@month.to_i, @week, @year.to_i, @stores, @dep)
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

      @resultStore << { :label =>  element[:label], :saleWeek => saleWeek}
    end
  end

  def json_month
    @month = params[:month].to_i
    @week  = params[:week].to_i   #replace params later
    @year  = params[:year].to_i

    @stores = Store.by_cluster(params[:cluster])
    @dep    = Department.find(params[:department])


    beginning_of_month = "#{@year}-#{@month}-01".to_date
    end_of_month = beginning_of_month.end_of_month

    month_start = beginning_of_month.strftime("%d").to_i
    month_end   = end_of_month.strftime("%d").to_i

    #generar element
    elements = element(@month, @week, @year, @stores, @dep)

    labels = []

    elementSet = []

    elements.each do |element|
      elementSet << { label: element[:label], fill: element[:fill], data: element[:realMonth],  backgroundColor: element[:backgroundColor], borderColor: element[:borderColor]}
    end

    @data = { :labels => elements.first[:dates], :datasets => elementSet }
    render json: @data
  end

  def element(month, week, year, stores, dep)
    departments = []
    element = []

    colors = []
    colorCount = 0

    colors << '#65ff00'
    colors << '#33d6ce'

    beginning_of_month = "#{@year}-#{@month}-01".to_date
    end_of_month = beginning_of_month.end_of_month

    month_start = beginning_of_month.strftime("%d").to_i
    month_end   = end_of_month.strftime("%d").to_i


    @staffing = staffing
    dates = []
    days  = []

    (beginning_of_month..end_of_month).each do |d|
      dates << d.strftime("%Y%m%d")
    end

    #sacar dotacion por dia
    dates.each do |d|
      days << @staffing[d.to_sym][:hours].values.sum
    end

    #obtener departamentos
    @stores.each do |store|
      departments << Department.where(store: store[:id], master_id: @dep.id)
    end

    #obtener valores
    if departments.first.length > 0
      departments.each do |department|
        sale_reals = SaleReal.where(department_id: department.first[:master_id], store_id: department.first[:store_id], year: @year, month: @month).order(:sale_date)
        totalMonth = []
        realMonth = []
        dotMonth = []
        sale_date = []

        sale_reals.each do |sale|
          sale_date << sale[:sale_date].strftime("%d")
          totalRealDay = sale[:nine]+sale[:ten]+sale[:eleven]+sale[:twelve]+sale[:thirteen]+sale[:fourteen]+sale[:fifteen]+sale[:sixteen]+sale[:seventeen]+sale[:eighteen]+sale[:nineteen]+sale[:twenty]+sale[:twenty_one]+sale[:twenty_two]+sale[:twenty_three]+sale[:twenty_four]
          totalDotDay = @staffing[("#{sale[:sale_date].strftime("%Y%m%d")}").to_sym][:hours].values.sum
          realMonth  << totalRealDay
          dotMonth   << totalDotDay
          totalMonth << (totalRealDay.to_f / totalDotDay.to_f).round
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



        element << { dates: sale_date, label: store[:name], fill: 'false', data: saleWeek, totalMonth: totalMonth.map(&:to_s), realMonth: realMonth, dotMonth: dotMonth, backgroundColor: colors[colorCount], borderColor: colors[colorCount]}
        colorCount += 1
      end
    end
    return element
  end
end
