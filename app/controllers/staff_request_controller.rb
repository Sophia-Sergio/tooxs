class StaffRequestController < ApplicationController
  def index

    if params[:month] == nil
      params[:year]  = Date.today.strftime("%Y")
      params[:month] = Date.today.strftime("%m")
      params[:departments] = []
      params[:store] = 1
    end

    @month = params[:month].to_i
    @year = params[:year].to_i
    @dep = params[:departments]
    @store = params[:store].to_i
    store = Store.find(@store)

    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Dotación personal", :staffing_index_path
  	@search       = ''
    @stores       = Store.all.order(:id)
    @departments  = MasterDepartment.all.order(:id)

    #obtener los turnos no cubiertos dependiendo de los parametros de busqueda
    @resultadoBusqueda = []
    @resultadoSolicitud = []

    @dep.each do |dep_id|    
      if dep_id == "0"
        @dep = MasterDepartment.all.pluck(:id)
      end
    end

    @dep.each do |dep_id|

      # buscar el departamento id
      departament = Department.where(master_id: dep_id, store_id: @store).first
      if departament 
        dataCase = DataCase.where(dep_num: departament.id, month: @month).first
        if dataCase
          turnos     = shifts_covered(dataCase.id_case, departament.id , @store)             
          turnoCount = 1
          turnos[:turnosNoCubiertos].each do |cantidad|   
            if cantidad > 0   
              month = params[:month].to_i 
              if params[:month].to_i < 10
               month = "0#{params[:month].to_i}"                            
              end           
              @resultadoBusqueda << {:tienda => store, :dep => departament, :turno => turnoCount, :descrip => "turno #{turnoCount}", :cantidad => cantidad, :fecha => "01-#{month}-#{params[:year]}"}
              turnoCount += 1
            end         
          end         
        end 
      end     
      # buscar el caso del departamento
    end
  end
  #recibe las solicitudes y las enlista para que el usuario seleccione las que publicará
  def request_send
    @search = ''
    count_row = params[:count_row].to_i
    
    @carga = []
    (1..count_row).each do |i|
      if params["cargar_#{i}"] == "on"

        store = Store.find(params["store_#{i}"].to_i)
        dep = Department.find(params["dep_id_#{i}"].to_i)
        turno = AvailableShift.where(num: params["turno_id_#{i}"].to_i).first
        @carga << { :store => store, :dep => dep, :turno => turno, :cantidad => params["cantidad_#{i}"], :fecha => params["fecha_#{i}"]}  
      end
    end
  end

  def generated
    count_row = params[:count_row].to_i
    request = Request.create!(user_id: current_user.id)

    if params["pos_interna"] == "on"
      pos_interna = 1
    else
      pos_interna = 0
    end

    if params["laborum"] == "on"
      laborum = 1
    else
      laborum = 0
    end

    if params["trabajando"] == "on"
      trabajando = 1
    else
      trabajando = 0
    end

    if params["rrhh"] == "on"
      rrhh = 1
    else
      rrhh = 0
    end

    (1..count_row).each do |i|
      RequestDetail.create!(request_id: request.id , department_id: params["dep_#{i}"].to_i, turn: params["turno_#{i}"].to_i, quantity: params["cantidad_#{i}"].to_i, 
        rrhh: rrhh, internal: pos_interna, laborum: laborum, trabajando: trabajando)
    end

    redirect_to staff_request_show_url
  end

  def show
      
    @request_details = RequestDetail.all
    #@accountUrl = Account.find_by_id(current_account_id)
    #@details = Detail.find_by_acc_id(@accountUrl.id)
  end

end
