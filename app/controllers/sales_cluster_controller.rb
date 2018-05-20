class SalesClusterController < ApplicationController

  def index
    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Productividad por Segmento", :sales_cluster_index_path       
    @search       = ''
    #@stores       = Store.all.order(:id)
    @clusters     = Cluster.all.order(:id)
    @departments  = Department.distinct.pluck(:name)
    @masterDepartments = MasterDepartment.all.order(:id)


    #@seasons      = [ [id: 1, name:'moo'] , [id: 2, name:'lala'] ]
  end
  
  def month
    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Productividad por Segmento", :sales_cluster_index_path  
    add_breadcrumb "Productividad mensual", :month_sales_cluster_index_path 

    @search       = ''

    @stores      = Store.where(cluster_id: params[:cluster])
    @clusters     = Cluster.all.order(:id)
    @departments  = Department.distinct.pluck(:name)
    @masterDepartments = MasterDepartment.all.order(:id)
    @masterDeparment   = MasterDepartment.find(params[:department])

    @cluster_name =  Cluster.find(params[:cluster]).name
    @year  = params[:year].to_i  
    @month = params[:month].to_i
  end
  
  def json_month

    #binding.pry
    @month = params[:month].to_i
    @week  = params[:week].to_i   #replace params later
    @year  = params[:year].to_i

    @stores = Store.where(cluster_id: params[:cluster])
    @dep    = Department.find(params[:department])

    departments = []
    element = []
    #obtener departamentos

    colors = []
    colorCount = 0

    colors << 'rgb(255, 205, 86)'
    colors << 'rgb(153, 102, 255)'
       

    @stores.each do |store|
      departments << Department.where(store: store[:id], master_id: params[:department])
    end

    #obtener valores
    departments.each do |department|
      sale_reals = SaleReal.where(department_id: department.first[:master_id], store_id: department.first[:store_id], year: @year, month: @month) 
      totalMonth = []
      sale_reals.each do |sale|
        totalMonth << sale[:nine]+sale[:ten]+sale[:eleven]+sale[:twelve]+sale[:thirteen]+sale[:fourteen]+sale[:fifteen]+sale[:sixteen]+sale[:seventeen]+sale[:eighteen]+sale[:nineteen]+sale[:twenty]+sale[:twenty_one]+sale[:twenty_two]+sale[:twenty_three]+sale[:twenty_four]
      end
      store = Store.find(department.first[:store_id])
      element << { label: store[:name], fill: 'false', data: totalMonth.map(&:to_s), backgroundColor: colors[colorCount], borderColor: colors[colorCount]}
      colorCount += 1
    end
    #generar element    
    labels = []
    (1..31).each do |i|
      labels << "#{i}"    
    end

    @data = { :labels => labels, :datasets => element }
    render json: @data
    #binding.pry
  end
end
