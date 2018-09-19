class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :edit, :update, :destroy]

  # GET /sellers
  # GET /sellers.json

  def calendar_shift

      if params[:id] == nil
        params[:id] = current_user.id
      end

      @seller    = Seller.find(params[:id])
      year_shift = @seller.my_shift

      @shifts = year_shift.map do |s|
      
        if s[1] != "0:00"
          c = 'bg-success-lighter'
          title = "#{s[1]}-#{s[2]}"
        else 
          c = 'bg-danger'
          title = "Libre"
        end

        { :id => @seller.id, :title => title , :class => c , :start => "#{s[0]} #{s[1]}".to_datetime.strftime("%FT%R"), :end => "#{s[0]} #{s[2]}".to_datetime.strftime("%FT%R")  }
      end

      #json = @shifts.to_json
      ## breaks 

      sb = ShiftBreak.where(seller_id: @seller)

      @br = sb.map do |s|
        { :id => @seller.id, :title => "#{s.time.strftime('%H:%M')}-#{(s.time+1.hour).strftime('%H:%M')}", :class => 'bg-warning-light' , :start => "#{s.date} #{s.time}".to_datetime.strftime("%FT%R"), :end => "#{s.date} #{s.time+1.hour}".to_datetime.strftime("%FT%R")  }
      end

      json = (@shifts + @br).to_json


      render json: json
  end

  def assigned_shift
    @shift = AvailableShift.num(:params[:num])
  end

  def index
    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Colaboradores", :sellers_path

    @search       = ''
    @stores       = Store.all.order(:id)
    @departments  = Department.all.order(:id)
    @available_shifts = AvailableShift.select("num as id, name").distinct

    store           = params[:store]
    department      = params[:department]
    available_shift = params[:available_shift]

    if department != nil
      @sellers = Seller.where(store: store, department: department)
    else
      @sellers = Seller.all
    end

  end

  def import
    if Seller.from_xlsx(params[:file].tempfile)
      flash[:notice] = 'Importado con éxito'
    else
      flash[:error] = 'Algo ha salido mal, intentalo de nuevo'
    end

    redirect_to sellers_url
  end

  # GET /sellers/1
  # GET /sellers/1.json
  def show
    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Colaboradores", :sellers_path
    add_breadcrumb "Detalle", :seller_path

    if params[:id] == nil
      params[:id] = current_user.id
    end

    @seller_id = params[:id]
    seller = Seller.find(@seller_id)
    today  = Date.today.strftime("%Y%m%d")
    @month = 6#Date.today.strftime("%m").to_i
    @year  = Date.today.strftime("%Y").to_i
    @dayNow = day_now_charged
    #@dayNow = day_now(Date.today.strftime("%Y").to_s, Date.today.strftime("%m").to_s)
    
    @productivity = productivity_seller(seller, @month, 2018)

    @ventas_colaborador = Array.new(15)
      
    for i in 0..@ventas_colaborador.length-1
      @ventas_colaborador[i] = Array.new(7)
    end 

    dia = 0

    @productivity[:one].each do |p, k|
      hora = 0
      k.each do |a|
        @ventas_colaborador[hora][dia]  = a
      hora += 1
      end
      dia += 1
    end

    #binding.pry
    @x           = seller.my_shift.index{|x| x[0]== today.to_s}
    @sp          = sale_plan_per_week(seller, Date.today.strftime("%Y").to_s, 06.to_s)
    @real_week   = sale_real_per_week(seller, Date.today.strftime("%Y").to_s, 06.to_s)
    @sp_staffing = seller_staffing_per_week(seller, 06.to_s, Date.today.strftime("%Y").to_s)
    
    #calcula el plan mensual
    seller_plan = seller_staffing(seller, @month, @year)
    @totalNow = 0
    (1..@dayNow[:week]).each do |week|
      @totalNow += seller_plan[week - 1].first.values.first[:seller_plan_per_day].inject(:+)
    end

    #cacula las ventas totales
    j = 0
    @totalRealMonth = 0

    @sp.each do |k,v|
      if @real_week[j] != nil
        @real_week[j].first.values.first[:sale_per_day].each do |d|
          @totalRealMonth +=  d.to_i
        end
      end
      j += 1 #permite cargar la primera semana para los meses de 5 semanas
    end
    #calcula cumplimiento
    @cumplimiento = (@totalRealMonth.to_f / @totalNow.to_f) * 100

  end

  # GET /sellers/new
  def new
    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Colaboradores", :sellers_path
    add_breadcrumb "Crear", :new_seller_path
    @seller = Seller.new
  end

  # GET /sellers/1/edit
  def edit
  end

  # POST /sellers
  # POST /sellers.json
  def create
    @seller = Seller.new(seller_params)

    respond_to do |format|
      if @seller.save
        format.html { redirect_to @seller, notice: 'Seller was successfully created.' }
        format.json { render :show, status: :created, location: @seller }
      else
        format.html { render :new }
        format.json { render json: @seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sellers/1
  # PATCH/PUT /sellers/1.json
  def update
    respond_to do |format|
      if @seller.update(seller_params)
        format.html { redirect_to @seller, notice: 'Seller was successfully updated.' }
        format.json { render :show, status: :ok, location: @seller }
      else
        format.html { render :edit }
        format.json { render json: @seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sellers/1
  # DELETE /sellers/1.json
  def destroy
    @seller.destroy
    respond_to do |format|
      format.html { redirect_to sellers_url, notice: 'Seller was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller
      if params[:id] == nil
        params[:id] = current_user.id
      end
      @seller = Seller.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seller_params
      params.require(:seller).permit(:rut, :name, :lastname, :email, :phone, :street, :number, :city, :district, :county, :country, :department_id)
    end


    #script generador de breaks por id de usuario
    def generate_breaks
      @s = Seller.find(25)
        @s.my_shift.each do |d|
          ShiftBreak.create(seller_id:25, date: d[0].to_date, time: d[1].to_time+rand(1..2).hour) if d[1] != '0:00'
        end
    end

    #old 
    def sale_plan(seller,year,month)

      @staffing     = staffing
      @store        = seller.store.id
      @dep          = seller.department.id

      @year         = year #params[:year]    
      @month        = month #params[:month]

      beginning_of_month = "#{@year}-#{@month}-01".to_date
      end_of_month = beginning_of_month.end_of_month

      week_start = beginning_of_month.strftime("%V")
      week_end   = end_of_month.strftime("%V")

      #week fix if is last week of the year on first month
      week_start = '01' if week_start.to_i == 53  


      result = []

      #loop por cada semana del mes en cuestion
      (week_start..week_end).each do |w| 
        @week = w
        #@sp_week     = SalePlan.where(week: @week, :store => @store, :department => @dep)

        #totales week/month
        #sp_week_total         = SalePlan.where(week: @week, :store => @store, :department => @dep).group(:week).order(:week).sum("nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four")
        sp_month_total = SalePlan.where(month: @month, :store => @store, :department => @dep).group(:month).order(:month).sum("nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four")

        #sp_total_week = sp_week_total.first[1].to_i
        sp_total_month = sp_month_total.first[1].to_i

        #data de venta real año anterior de la semana en cuestion
        @historic_week = HistoricSale.where(week: @week , :store => @store, :department => @dep, year: @year)

        #data total de la venta del mes en base al año anterior
        @historic_total_month = HistoricSale.where(year: @year, month: @month, :store => @store, :department => @dep).group(:month).order(:month).sum("nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four")
        historic_total_month_amount   = @historic_total_month.first[1].to_i

        @dates_week = []
        @dates_week_2 = []

        @year_plus_one = @year.to_i + 1

        (1..7).each do |i|
          #@dates_week << Date.commercial(@year.to_i,@week.to_i,i).strftime('%d-%m-%Y')
          @dates_week << Date.commercial(@year.to_i,@week.to_i,i).strftime('%Y%m%d')
          @dates_week_2 << ( Date.commercial(@year_plus_one,@week.to_i,i)).strftime('%Y%m%d')
        end  

        nine = []
        ten = []
        eleven = []
        twelve = []
        thirteen = []
        fourteen = []
        fifteen = []
        sixteen = []
        seventeen = []
        eighteen = []
        nineteen = []
        twenty = []
        twenty_one = []
        twenty_two = []
        twenty_three = []
        twenty_four = []

        @historic_week.each do |s|
          nine << (s.nine.to_i).to_f
          ten << (s.ten.to_i).to_f
          eleven << (s.eleven.to_i).to_f
          twelve << (s.twelve.to_i).to_f
          thirteen << (s.thirteen.to_i).to_f
          fourteen << (s.fourteen.to_i).to_f
          fifteen << (s.fifteen.to_i).to_f
          sixteen << (s.sixteen.to_i).to_f
          seventeen << (s.seventeen.to_i).to_f
          eighteen << (s.eighteen.to_i).to_f
          nineteen << (s.nineteen.to_i).to_f
          twenty << (s.twenty.to_i).to_f
          twenty_one << (s.twenty_one.to_i).to_f
          twenty_two << (s.twenty_two.to_i).to_f
          twenty_three << (s.twenty_three.to_i).to_f
          twenty_four << (s.twenty_four.to_i).to_f
        end

        week = {

         '09:00' => nine,
         '10:00' => ten,
         '11:00' => eleven,
         '12:00' => twelve,
         '13:00' => thirteen,
         '14:00' => fourteen,
         '15:00' => fifteen,
         '16:00' => sixteen,
         '17:00' => seventeen,
         '18:00' => eighteen,
         '19:00' => nineteen,
         '20:00' => twenty,
         '21:00' => twenty_one,
         '22:00' => twenty_two,
         '23:00' => twenty_three,
         '00:00' => twenty_four
       }

       #aplicar divisor

       sellers_store_department = Seller.where(store: seller.store, department: seller.department)

       weeks_in_month = (week_end.to_i - week_start.to_i)+1

       staffing_week = staffing_draw(@dates_week_2[0].to_i)

        porc = week.inject({}) do |carry, (key, array)|

          carry[key] = array.map.with_index do |value,i|  
            if value == 0
              0
            else
              hour  = key.to_i.to_s.to_sym
              n     = staffing_week[:draw][hour][0][i]

               if n == 0
                 -1
               else
                 ##(((((value / real_total_historic)))*sp_total_month/n)).round(0); 
                 #binding.pry
                 ((( (value/ historic_total_month_amount ).round(4) ) * sp_total_month ) / n ).round(0)
                 #binding.pry
              end
 
            end
    
          end
          carry
        end
          #binding.pry
        sale_per_day    = porc.values.transpose.map {|x| x.reduce(:+)}

        spd = []
        
        staffing_week[:draw].values.each{ |v| spd << v.first }

        sellers_per_day = spd.transpose.map {|x| x.reduce(:+)}

        

        data = {  :total_month_historic => historic_total_month_amount,
                  :week => week,
                  :porc => porc,
                  :staffing_week => staffing_week,
                  :weeks_in_month => [weeks_in_month,week_start,week_end],
                  :sale_per_day=> sale_per_day, 
                  :sellers => sellers_store_department.count, 
                  :sellers_per_day => sellers_per_day,
                  :dates => @dates_week
                }

        result << [ w => data ]
      end

        #binding.pry

       return result

      #incluye toda la semana, independiente si pertenece a otro mes
      #sp_week   = SalePlan.where(sale_date: @dates_week[0].to_date..@dates_week[6].to_date, store: @store , department: @dep)
    end

    #old
    def sale_real(seller, year, month)

      @store        = seller.store.id
      @dep          = seller.department.id

      @year         = year #params[:year]    
      @month        = month #params[:month]

      beginning_of_month = "#{@year}-#{@month}-01".to_date
      end_of_month = beginning_of_month.end_of_month

      week_start = beginning_of_month.strftime("%V")
      week_end   = end_of_month.strftime("%V")

      #week fix if is last week of the year on first month
      week_start = '01' if week_start.to_i == 53  



      result = []
      (week_start..week_end).each do |w| 
        @week = w

        @real_week  = SaleReal.where(week: @week, :store => @store, :department => @dep, year: @year)

        @real_total_month  = SaleReal.where(year: @year, month: @month, :store => @store, :department => @dep).group(:month).order(:month).sum("nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four")


        @year_plus_one = @year.to_i + 1

        @dates_week = []
        (1..7).each do |i|
          @dates_week << Date.commercial(@year.to_i,@week.to_i,i).strftime('%d-%m-%Y')
          @dates_week_2 << ( Date.commercial(@year_plus_one,@week.to_i,i)).strftime('%Y%m%d')
        end  

        nine = []
        ten = []
        eleven = []
        twelve = []
        thirteen = []
        fourteen = []
        fifteen = []
        sixteen = []
        seventeen = []
        eighteen = []
        nineteen = []
        twenty = []
        twenty_one = []
        twenty_two = []
        twenty_three = []
        twenty_four = []

        @real_week.each do |s|
          nine << (s.nine.to_i).to_f
          ten << (s.ten.to_i).to_f
          eleven << (s.eleven.to_i).to_f
          twelve << (s.twelve.to_i).to_f
          thirteen << (s.thirteen.to_i).to_f
          fourteen << (s.fourteen.to_i).to_f
          fifteen << (s.fifteen.to_i).to_f
          sixteen << (s.sixteen.to_i).to_f
          seventeen << (s.seventeen.to_i).to_f
          eighteen << (s.eighteen.to_i).to_f
          nineteen << (s.nineteen.to_i).to_f
          twenty << (s.twenty.to_i).to_f
          twenty_one << (s.twenty_one.to_i).to_f
          twenty_two << (s.twenty_two.to_i).to_f
          twenty_three << (s.twenty_three.to_i).to_f
          twenty_four << (s.twenty_four.to_i).to_f
        end

        week = {

         '09:00' => nine,
         '10:00' => ten,
         '11:00' => eleven,
         '12:00' => twelve,
         '13:00' => thirteen,
         '14:00' => fourteen,
         '15:00' => fifteen,
         '16:00' => sixteen,
         '17:00' => seventeen,
         '18:00' => eighteen,
         '19:00' => nineteen,
         '20:00' => twenty,
         '21:00' => twenty_one,
         '22:00' => twenty_two,
         '23:00' => twenty_three,
         '00:00' => twenty_four
        }
      

        staffing_week = staffing_draw(@dates_week_2[0].to_i)

        sale_per_day_total = week.values.transpose.map {|x| x.reduce(:+)}

        sale_per_day_seller = sale_per_day_total.map{|x| (x/9).round(0)}


        data = {:week => week, :sale_per_day => sale_per_day_seller, :dates => @dates_week, :real_total_month => @real_total_month.first[1].to_i}

        result << [ w => data ]
      end
      #binding.pry
      return result
      #incluye toda la semana, independiente si pertenece a otro mes
      #sp_week   = SalePlan.where(sale_date: @dates_week[0].to_date..@dates_week[6].to_date, store: @store , department: @dep)
    end 

    def sale_real_per_week(seller,year,month)
      @store        = seller.store.id
      @dep          = seller.department.id
      @year         = year #params[:year]    
      @month        = month #params[:month]
      dayNow = day_now_charged
      result = []
      day = Array.new(7)


      (1..dayNow[:week]).each do |w|
        dayCount = 0
        @week = w
        day = Array.new(7)
        (1..7).each do |d|
          day[dayCount] = SaleBySeller.where(month: month, seller: seller.id, week: w, day: d, department: @dep, year: @year).sum("sale")
          dayCount +=1 
        end
          data = {:week => @week, :sale_per_day => day}
          result << [ w => data ]
      end
      return result
    end 

    def sale_plan_per_week(seller, year, month)
      @store        = seller.store.id
      @dep          = seller.department.id
      @year         = year #params[:year]    
      @month        = month #params[:month]

      beginning_of_month = "#{@year}-#{@month}-01".to_date
      end_of_month = beginning_of_month.end_of_month

      week_start = beginning_of_month.strftime("%V")
      week_end   = end_of_month.strftime("%V")

      result = []
      day = Array.new(7)
      week_total = week_end.to_i - week_start.to_i;

      weekSet = 1

      (week_start..week_end).each do |w|
        dayCount = 0
        @week = w
        @dates_week = []
        day = Array.new(7)

        (1..7).each do |d|
          @dates_week << Date.commercial(@year.to_i,@week.to_i,d).strftime('%d-%m-%Y')

          # acá hacer la magia 
          day[dayCount] = SalePlan.where(month: month, day_number: d, store_id: @store, department_id: @dep, year: @year)
          

          day[dayCount] = 0 if day[dayCount] == nil 
          dayCount +=1 
        end
        data = {:week => weekSet, :dates => @dates_week, :sale_per_day => day}
        weekSet += 1 
        result << [ w => data ]
      end
      return result
    end


    def staffing_1
      
      days = {}
      date_start  = Date.today.beginning_of_year
      date_end    = Date.today.end_of_year + 1.year
      #defino un array con los todos los dias del año

      (date_start..date_end).each do |d|
        #convierto en sym el dia
        day = d.strftime("%Y%m%d").to_sym

        days[day] = {:hours => [], :sellers => []}

      end

      ##busco los vendedores y veo sus turnos
      sellers = Seller.where(store: 1, department: 1)

      sellers.each do |s|
        s.my_shift.each do |ms|
          day = ms[0].to_sym
        
            hours = []
            active_sellers = []
            (ms[1].to_i.. ms[2].to_i).each {|d| hours << d }

          #binding.pry if days[day].nil?
          days[day][:hours] << hours
          days[day][:sellers]  << s.fullname
        end
       
      end

      
        days    = days.each { |k,v| days[k][:hours] = v[:hours].flatten }
        result  = days.each { |k,v| days[k][:hours] = v[:hours].inject(Hash.new(0)) { |h, e| h[e] += 1 ; h }}
        #binding.pry
    end

    def seller_staffing_per_week(seller,month,year)

      @store        = seller.store.id
      @dep          = seller.department.id
      @year         = year #params[:year]    
      @month        = month #params[:month]


      result = []  
      (1..4).each do |w|
        @week = w
        countSemana = 0
        dates_week = []
        dayResult = Array.new(7)
        planResult = Array.new(7)
        (1..7).each do |d|
          #recorrer todos los turnos
          @days = AvailableShift.where(week: w, day: d)  
          countAll = 0 
          @days.each do |s|
            countAll += 1 if s.nine
            countAll += 1 if s.ten
            countAll += 1 if s.eleven
            countAll += 1 if s.twelve
            countAll += 1 if s.thirteen
            countAll += 1 if s.fourteen
            countAll += 1 if s.fifteen
            countAll += 1 if s.sixteen
            countAll += 1 if s.seventeen
            countAll += 1 if s.eighteen
            countAll += 1 if s.nineteen
            countAll += 1 if s.twenty
            countAll += 1 if s.twenty_one
            countAll += 1 if s.twenty_two
            countAll += 1 if s.twenty_three
            countAll += 1 if s.twenty_four
          end
          
          #recorrer turno del vendedor
          @day = AvailableShift.where( num: seller.assigned_shift, week: @week, day: d)  
          count = 0 
          @day.each do |s|
            count += 1 if s.nine
            count += 1 if s.ten
            count += 1 if s.eleven
            count += 1 if s.twelve
            count += 1 if s.thirteen
            count += 1 if s.fourteen
            count += 1 if s.fifteen
            count += 1 if s.sixteen
            count += 1 if s.seventeen
            count += 1 if s.eighteen
            count += 1 if s.nineteen
            count += 1 if s.twenty
            count += 1 if s.twenty_one
            count += 1 if s.twenty_two
            count += 1 if s.twenty_three
            count += 1 if s.twenty_four
          end

          @sp_m1 = SalePlan.where(year: @year).where(month: @month, store_id: @store, department_id: @dep, week: @week, day_number: d).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}

          dayResult[d-1] = count

          planResult[d-1] = count.to_i * (@sp_m1.first.to_i / countAll.to_i)
          dates_week = { :staffing_per_day => dayResult, :seller_plan_per_day => planResult}
        end
        result << [ w => dates_week ]
        countSemana += 1
      end  

      return result   
    end

    def productivity_seller(seller,month,year)
      
      ##usaremos febrero 2018 para esta muestra:
      ## sacamos el 1er dia lunes del mes "2" del 2018 desde el Plan de ventas.
      month_search = month

      start_date = Sp.where(:month => month).where(:dow => 1).where(:week => 1).select(:date).first
      start_date = start_date.date.strftime('%Y%m%d')
      
      ##buscamos los turnos de este vendedor
      shifts_seller = seller.my_shift
      
      ##ordenamos los turnos
      shifts = {}
      shifts_seller.each do |s|
        shift_date = s.first.to_s.to_sym
        shifts[shift_date] = {:start => s.second, :end => s.third, :date => s.first}
      end

      #fechas de la semanas del mes en curso
      w1 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 1).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
      w2 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 2).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
      w3 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 3).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
      w4 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 4).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
      ## opcional no aplicable para este mes 
      ## w5 = {} 

      week = {:one => {}, :two => {}, :three => {}, :four => {}, :five => {}}
      
      #turnos
      week[:one][:shift]    = week_schedule(w1,shifts)
      week[:two][:shift]    = week_schedule(w2,shifts)
      week[:three][:shift]  = week_schedule(w3,shifts)
      week[:four][:shift]   = week_schedule(w4,shifts)
      
      #plan de venta
      #recupero los planes de venta por semana del mes

      sp_w1 =  Sp.where(:month => month).where(:dow => [1..7]).where(:week => 1).where(:year => year)
      sp_w2 =  Sp.where(:month => month).where(:dow => [1..7]).where(:week => 1).where(:year => year)
      sp_w3 =  Sp.where(:month => month).where(:dow => [1..7]).where(:week => 1).where(:year => year)
      sp_w4 =  Sp.where(:month => month).where(:dow => [1..7]).where(:week => 1).where(:year => year)

      week[:one][:sp] = week_sale_plan(sp_w1)
      week[:two][:sp] = week_sale_plan(sp_w2)
      week[:three][:sp] = week_sale_plan(sp_w3)
      week[:four][:sp] = week_sale_plan(sp_w4)

      #usuarios en turnos
      week[:one][:people] = week_staffing(w1)
      week[:two][:people] = week_staffing(w2)
      week[:three][:people] = week_staffing(w3)
      week[:four][:people] = week_staffing(w4)
      
      wp = {}

      wp[:one] = week_productivity(week[:one])    
      
      return wp


    end

    private

    def week_schedule(w,shifts)

      #hours definition
      day_hours = {
        :'09:00' => :nine,
        :'10:00' => :ten,
        :'11:00' => :eleven,
        :'12:00' => :twelve,
        :'13:00' => :thirteen,
        :'14:00' => :fourteen,
        :'15:00' => :fifteen,
        :'16:00' => :sixteen,
        :'17:00' => :seventeen,
        :'18:00' => :eighteen,
        :'19:00' => :nineteen,
        :'20:00' => :twenty,
        :'21:00' => :twenty_one,
        :'22:00' => :twenty_two,
        :'23:00' => :twenty_three,
      }

      #clear schedule definition
      schedule =  {
        :nine => false,
        :ten => false,
        :eleven => false,
        :twelve => false,
        :thirteen => false,
        :fourteen => false,
        :fifteen => false,
        :sixteen => false,
        :seventeen => false,
        :eighteen => false,
        :nineteen => false,
        :twenty => false,
        :twenty_one => false,
        :twenty_two => false,
        :twenty_three => false,
      }

      schedule_hours = {}      
      w.each do |d|
        #recorro la semana dia por dia para buscar hora de inicio y fin
        current_shift = shifts[d]
        #binding.pry

        open_hour   = '09:00'.to_time
        close_hour  = '23:00'.to_time

        current_day_schedule = schedule.dup

        start_shift   = current_shift[:start].to_time
        end_shift     = current_shift[:end].to_time

        #binding.pry



        if current_shift[:start] != "0:00"
          while (start_shift <= end_shift)
            puts start_shift
            if (open_hour..close_hour).cover? start_shift
              hour_word = start_shift.to_time.strftime("%H:%M")
              current_day_schedule[day_hours[hour_word.to_sym]] = true
              start_shift = start_shift+1.hour
            end
          end
          schedule_hours[d] = current_day_schedule
        else
          schedule_hours[d] = current_day_schedule
        end
      end

      return schedule_hours
    end

    def week_sale_plan(w)

      sale_plan_day = {}
      w.each do |d|
        sale_plan_day[d.date.strftime('%Y%m%d').to_sym] = d.to_hour
      end

      return sale_plan_day
    end

    def week_staffing(w)
      staffing_year = staffing

      day_hours = {
        :'9' => :nine,
        :'10' => :ten,
        :'11' => :eleven,
        :'12' => :twelve,
        :'13' => :thirteen,
        :'14' => :fourteen,
        :'15' => :fifteen,
        :'16' => :sixteen,
        :'17' => :seventeen,
        :'18' => :eighteen,
        :'19' => :nineteen,
        :'20' => :twenty,
        :'21' => :twenty_one,
        :'22' => :twenty_two,
        :'23' => :twenty_three,
      }

      planning =  {
        :nine => false,
        :ten => false,
        :eleven => false,
        :twelve => false,
        :thirteen => false,
        :fourteen => false,
        :fifteen => false,
        :sixteen => false,
        :seventeen => false,
        :eighteen => false,
        :nineteen => false,
        :twenty => false,
        :twenty_one => false,
        :twenty_two => false,
        :twenty_three => false,
      }

      weekly_plan ={}

      w.each do |d|
        day_planning = planning.dup
        current_day = staffing_year[d]

        current_day[:hours].each do |h|
          
          index = h[0].to_s.to_sym
          day_planning[day_hours[index]] = h[1]
        end

        weekly_plan[d] = day_planning

      end

      return weekly_plan
    end

    def week_productivity(w)

      shifts      = w[:shift]
      days_keys   = w[:shift].keys
      hours_keys  = w[:shift][days_keys.first].keys

      prd_d_empty = []

      daily_prd = {}
      
      days_keys.each do |d|
        prd_d = prd_d_empty.dup
        w[:shift][d].each do |h|
          if h[1] == false
            #si es falso prd = 0
            prd_d << 0
          else
            ##hago los calculos en este dia
            sp_h      = w[:sp][d][h[0]]
            people_h  = w[:people][d][h[0]]
            
            if sp_h == 0 or people_h == 0
              prd_d << 0 
            else  
              pph = sp_h.to_i / people_h.to_i
            end

            prd_d << pph
          end
        end
        daily_prd[d] = prd_d
      end

      return daily_prd

      

    end



end
