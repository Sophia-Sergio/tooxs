class SalesClusterController < ApplicationController

  def index
    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Ventas por Segmento", :sales_cluster_index_path       
    @search       = ''
    @clusters     = Cluster.where(id: 1)
    @masterDepartments = MasterDepartment.where(id: 1)
    @month = Date.today.strftime("%m").to_i

    #@seasons      = [ [id: 1, name:'moo'] , [id: 2, name:'lala'] ]
  end
  
  def month
    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Ventas por Segmento", :sales_cluster_index_path  
    add_breadcrumb "Ventas mensual", :month_sales_cluster_index_path 

    @search       = ''

    @stores      = Store.where(cluster_id: params[:cluster])
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

      @resultStore << { :label =>  element[:label], :saleWeek => saleWeek}
    end
  end
  
  def json_month
    @month = params[:month].to_i
    @week  = params[:week].to_i   #replace params later
    @year  = params[:year].to_i

    @stores = Store.where(cluster_id: params[:cluster])
    @dep    = Department.find(params[:department])


    beginning_of_month = "#{@year}-#{@month}-01".to_date
    end_of_month = beginning_of_month.end_of_month

    month_start = beginning_of_month.strftime("%d").to_i
    month_end   = end_of_month.strftime("%d").to_i
    #binding.pry

    #generar element 
    element = element(@month, @week, @year, @stores, @dep)

    labels = []

    element.first[:data].count.times do |i|
      labels << i+1
    end

    @data = { :labels => labels, :datasets => element }
    render json: @data
    #binding.pry
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
      departments << Department.where(store: store[:id], master_id: params[:department])
    end

    #obtener valores
    departments.each do |department|
      sale_reals = SaleReal.where(department_id: department.first[:master_id], store_id: department.first[:store_id], year: @year, month: @month) 
      totalMonth = []
      realMonth = []
      dotMonth = []
      sale_reals.each do |sale|
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


        
      element << { label: store[:name], fill: 'false', data: saleWeek, totalMonth: totalMonth.map(&:to_s), realMonth: realMonth, dotMonth: dotMonth, backgroundColor: colors[colorCount], borderColor: colors[colorCount]}
      colorCount += 1
    end
    return element
  end
end
