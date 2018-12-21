class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def staffing
    days = {}
    date_start  = Date.today.beginning_of_year - 1.year
    date_end    = Date.today.end_of_year + 1.year
    # array with all the days of 2 years

    (date_start..date_end).each do |d|
      # convierto en sym el dia
      day = d.strftime('%Y%m%d').to_sym
      # crea un array desde el 01-01-2017 al 31-12-2019
      days[day] = { hours: [], sellers: [] }
    end

    # busco los vendedores y veo sus turnos
    sellers = Seller.where(store: 1, department: 1)


    sellers.each do |s|
      s.my_shift.each do |my_shift|

        day = my_shift[0].to_sym
        hours = (my_shift[1].to_i..my_shift[2].to_i).to_a
        days[day][:hours] << hours
        days[day][:sellers] << s.fullname
      end
    end
    days = days.each { |k, v| days[k][:hours] = v[:hours].flatten }
    days.each { |k, v| days[k][:hours] = v[:hours].inject(Hash.new(0)) { |h, e| h[e] += 1 ; h }}
  end

  def staffing_draw(start_date)
    @staffing = staffing
    hours = []
    dates = []

    start_date = start_date.to_s.to_date
    end_date = start_date + 6.days

    day_hours = [
      :nine,
      :ten,
      :eleven,
      :twelve,
      :thirteen,
      :fourteen,
      :fifteen,
      :sixteen,
      :seventeen,
      :eighteen,
      :nineteen,
      :twenty,
      :twenty_one,
      :twenty_two,
      :twenty_three
    ]

    (9..24).each {|h| hours << h }

    (start_date..end_date).each do |d|
      dates << d.strftime("%Y%m%d")
    end
    result = {}
    hours.each_with_index do |h,i|
      result[h.to_s.to_sym] = []
      #result[h] = []
      days = []
      dates.each do |d|
        days << @staffing[d.to_sym][:hours][h]
      end
      #result[h.to_s.to_sym] << days
      result[h.to_s.to_sym] << days
    end
    spd = []

    result.values.each{ |v| spd << v.first }
    sellers_per_day = spd.transpose.map {|x| x.reduce(:+)}

    week = { :dates => dates, :draw => result, :sellers_per_day => sellers_per_day}
  end

  def seller_staffing(store, seller, opts = {})
    year  = opts[:year]
    month = opts[:year]

    @sellers = store.sellers.by_department(seller.department)

    result = []
    (1..4).each do |w|
      @week = w
      @dates_week = []
      dayResult = Array.new(7)
      planTotalResult = Array.new(7)
      planResult = Array.new(7)

      (1..7).each do |d|
          #recorrer todos los turnos
          countAll = 0
          countAllnine = 0
          countAllten = 0
          countAlleleven = 0
          countAlltwelve = 0
          countAllthirteen = 0
          countAllfourteen = 0
          countAllfifteen = 0
          countAllsixteen = 0
          countAllseventeen = 0
          countAlleighteen = 0
          countAllnineteen = 0
          countAlltwenty = 0
          countAlltwenty_one = 0
          countAlltwenty_two = 0
          countAlltwenty_three = 0
          countAlltwenty_four = 0

          @sellers.each do |seller|
            @days = AvailableShift.where(store_id: 1, num: seller.assigned_shift, week: @week, day: d, month: @month)
            @days.each do |s|

              countAllnine += 1 if s.nine
              countAll += 1 if s.nine

              countAllten += 1 if s.ten
              countAll += 1 if s.ten

              countAlleleven += 1 if s.eleven
              countAll += 1 if s.eleven

              countAlltwelve += 1 if s.twelve
              countAll += 1 if s.twelve

              countAllthirteen += 1 if s.thirteen
              countAll += 1 if s.thirteen

              countAllfourteen += 1 if s.fourteen
              print s.id if s.fourteen
              puts '-'*500
              countAll += 1 if s.fourteen

              countAllfifteen += 1 if s.fifteen
              countAll += 1 if s.fifteen

              countAllsixteen += 1 if s.sixteen
              countAll += 1 if s.sixteen

              countAllseventeen += 1 if s.seventeen
              countAll += 1 if s.seventeen

              countAlleighteen += 1 if s.eighteen
              countAll += 1 if s.eighteen

              countAllnineteen += 1 if s.nineteen
              countAll += 1 if s.nineteen

              countAlltwenty += 1 if s.twenty
              countAll += 1 if s.twenty

              countAlltwenty_one += 1 if s.twenty_one
              countAll += 1 if s.twenty_one

              countAlltwenty_two += 1 if s.twenty_two
              countAll += 1 if s.twenty_two

              countAlltwenty_three += 1 if s.twenty_three
              countAll += 1 if s.twenty_three

              countAlltwenty_four += 1 if s.twenty_four
              countAll += 1 if s.twenty_four
            end
          end

          @day = AvailableShift.where( num: seller.assigned_shift, week: @week, day: d, month: @month)
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


          @day = AvailableShift.where( num: seller.assigned_shift, week: @week, day: d, month: @month)
          saleMonth = 0

          @sp_day = PlanSale.where(year: @year).where(month: @month, store_id: @store, department_id: @dep, week: @week, day_number: d)

          saleMonthnine = 0
          saleMonthten = 0
          saleMontheleven = 0
          saleMonthtwelve = 0
          saleMonththirteen = 0
          saleMonthfourteen = 0
          saleMonthfifteen = 0
          saleMonthsixteen = 0
          saleMonthseventeen = 0
          saleMontheighteen = 0
          saleMonthnineteen = 0
          saleMonthtwenty = 0
          saleMonthtwenty_one = 0
          saleMonthtwenty_two = 0
          saleMonthtwenty_three = 0
          saleMonthtwenty_four = 0


          @day.each do |s|
            if @sp_day.length > 0
              saleMonthnine += @sp_day.first.nine if s.nine
              saleMonthten += @sp_day.first.ten if s.ten
              saleMontheleven += @sp_day.first.eleven if s.eleven
              saleMonthtwelve += @sp_day.first.twelve if s.twelve
              saleMonththirteen += @sp_day.first.thirteen if s.thirteen
              saleMonthfourteen += @sp_day.first.fourteen if s.fourteen
              saleMonthfifteen += @sp_day.first.fifteen if s.fifteen
              saleMonthsixteen += @sp_day.first.sixteen if s.sixteen
              saleMonthseventeen += @sp_day.first.seventeen if s.seventeen
              saleMontheighteen += @sp_day.first.eighteen if s.eighteen
              saleMonthnineteen += @sp_day.first.nineteen if s.nineteen
              saleMonthtwenty += @sp_day.first.twenty if s.twenty
              saleMonthtwenty_one += @sp_day.first.twenty_one if s.twenty_one
              saleMonthtwenty_two += @sp_day.first.twenty_two if s.twenty_two
              saleMonthtwenty_three += @sp_day.first.twenty_three if s.twenty_three
              saleMonthtwenty_four += @sp_day.first.twenty_four if s.twenty_four
            end
          end

          totalDaySeller = 0

          totalDaySeller += saleMonthnine / countAllnine if countAllnine != 0
          totalDaySeller += saleMonthten / countAllten if countAllten != 0
          totalDaySeller += saleMontheleven / countAlleleven if countAlleleven != 0
          totalDaySeller += saleMonthtwelve / countAlltwelve if countAlltwelve != 0
          totalDaySeller += saleMonththirteen / countAllthirteen if countAllthirteen != 0
          totalDaySeller += saleMonthfourteen / countAllfourteen if countAllfourteen != 0
          totalDaySeller += saleMonthfifteen / countAllfifteen if countAllfifteen != 0
          totalDaySeller += saleMonthsixteen / countAllsixteen if countAllsixteen != 0
          totalDaySeller += saleMonthseventeen / countAllseventeen if countAllseventeen != 0
          totalDaySeller += saleMontheighteen / countAlleighteen if countAlleighteen != 0
          totalDaySeller += saleMonthnineteen / countAllnineteen if countAllnineteen != 0
          totalDaySeller += saleMonthtwenty / countAlltwenty if countAlltwenty != 0
          totalDaySeller += saleMonthtwenty_one / countAlltwenty_one if countAlltwenty_one != 0
          totalDaySeller += saleMonthtwenty_two / countAlltwenty_two if countAlltwenty_two != 0
          totalDaySeller += saleMonthtwenty_three / countAlltwenty_three if countAlltwenty_three != 0
          totalDaySeller += saleMonthtwenty_four / countAlltwenty_four if countAlltwenty_four != 0

          @sp_m1 = PlanSale.where(year: @year).where(month: @month, store_id: @store, department_id: @dep, week: @week, day_number: d).map{|x| x.nine + x.ten + x.eleven + x.twelve + x.thirteen + x.fourteen + x.fifteen + x.sixteen + x.seventeen + x.eighteen + x.nineteen + x.twenty + x.twenty_one + x.twenty_two + x.twenty_three + x.twenty_four}
          dayResult[d-1] = count
          planTotalResult[d-1] = totalDaySeller
      end

      data = { :staffing_per_day => dayResult, :seller_plan_per_day => planTotalResult}
      result << [ @week => data ]
    end
    return result
  end

  def setNum(num)
    num_parse = ActiveSupport::NumberHelper::number_to_currency(num, { delimiter: "." })
    return num_parse
  end

  def brain_json(month, year, store, department)
    month = month.to_i
    year = year.to_i
    store = store.to_i
    department = department.to_i

    #[1,10,28,1] 1010672 # [numero, hora, dia, numero] valor
    # inicio crear plan_venta, tengo que crear el formato del plan de venta para 4 semanas

    spm1 = PlanSale.where(year: year, month: month, store_id: store, department_id: department).order(:id).map{|x, j|
      "[1,1,countRow,1] #{x.eleven}, " + "[1,2,countRow,1] #{x.twelve}, " + "[1,3,countRow,1] #{x.thirteen}, " +
      "[1,4,countRow,1] #{x.fourteen}, " + "[1,5,countRow,1] #{x.fifteen}, " + "[1,6,countRow,1] #{x.sixteen}, " +
      "[1,7,countRow,1] #{x.seventeen}, " +
      "[1,8,countRow,1] #{x.eighteen}, " + "[1,9,countRow,1] #{x.nineteen}, " + "[1,10,countRow,1] #{x.twenty}"
    }
    countRow = 1
    plan_venta_string = ''

    spm1.each { |day|
      plan_venta_string += " " + day.gsub('countRow', countRow.to_s)
      countRow += 1
    }
    plan_venta_string = plan_venta_string.slice 1 .. plan_venta_string.length
    # fin crear plan_venta

    data_case = DataCase.find_by(month: month, year: year, department: department)
    staffingCase = data_case.staffing_case

    if staffingCase
      @data =
      {
        'accion': 'ejecutar',
        'id_caso': data_case.id,
        'tolerancia': (3).round(1),
        'evaluar_dotacion_real': staffingCase.actual_staffing_eval.to_i,
        'tiempo_maximo': staffingCase.max_time.to_i,
        'usuario': staffingCase.user.to_s,
        'datos':
        {
          'num_turnos': data_case.turn_num,
          'num_departamentos': data_case.department.id,
          'num_ventanas': 1,
          'num_dias_ventana': data_case.day_num,
          'num_horas_dia': data_case.hour_day,
          'valor_hp': data_case.hp_val.round(1),
          'prod_obj': data_case.target_productivity.round(1),
          'VHP': '',
          'POV': data_case.pov,
          'Entrada_Almuerzo': data_case.lunch_in,
          'Horas_Almuerzo': data_case.lunch_hours,
          'min_horas': data_case.hour_min,
          'matriz_turnos': data_case.turns_matrix.to_s,
          'dotacion_real': data_case.real_dot.to_s,
          'plan_venta': plan_venta_string
        }
      }
    end
    @data.to_json
  end

  def calculo_semanal(datos, dias)
    semanasCount = 0
    diasCount = 1
    arraySemana = []
    for i in 0..datos.length - 1
      if arraySemana[semanasCount] == nil
        arraySemana[semanasCount] = 0
      end
      arraySemana[semanasCount] += datos[i].to_i
      if diasCount < dias
        diasCount += 1
      else
        diasCount = 1
        semanasCount += 1
      end
    end
    return arraySemana
  end

  def cerebro_plan_venta_opt(plan)
    if plan.length != 0
      plan = JSON.parse(plan)
      plan_venta_in = plan["datos"]["plan_venta"].to_s.split(", [")
      plan_venta_in[0] = plan_venta_in[0].gsub("[", "")
      num_horas_dia_in =  plan["datos"]["num_horas_dia"].to_i
      num_dias_ventana = plan["datos"]["num_dias_ventana"].to_i
      #sacar el plan de venta diario
      plan_venta_diario = Array.new(num_dias_ventana) { |i| i = 0 }
      #inicializar en 0
      for i in 0..plan_venta_in.length-1
        plan_hora = plan_venta_in[i].to_s.split("] ")
        plan_venta_diario[(plan_hora[0].to_s.split(",")[2]).to_i-1] = 0;
      end
      #sumatoria por día
      for i in 0..plan_venta_in.length-1
        plan_hora = plan_venta_in[i].to_s.split("] ")
        plan_venta_diario[(plan_hora[0].to_s.split(",")[2]).to_i-1] += plan_hora[1].to_f
      end

      for i in 0..plan_venta_diario.length-1
        plan_venta_diario[i] =  (plan_venta_diario[i].to_i).round
      end
    else
      plan_venta_in = ''
    end
    return plan_venta_diario
  end

  def total_turnos(plan, dotacion)
    if plan.length != 0
      matriz_turnos = plan["datos"]["matriz_turnos"].to_s.split(", [")
      matriz_turnos[0] = matriz_turnos[0].gsub("[", "")
      num_turnos = plan["datos"]["num_turnos"]

      matriz_turnos_in = []
      for i in 0..matriz_turnos.length-1
        turno = matriz_turnos[i].to_s.split("] ")[0]
        turno_1 = matriz_turnos[i].to_s.split("] ")[1]
        coordenadas = turno.to_s.split(",")
        matriz_turnos_in[i] = { :turno => coordenadas[0], :hora => coordenadas[1], :dia => coordenadas[2] , :valor => (turno_1).to_i}
      end

      #//////////////// dotacion real //////////////////////////////////

      dotacion_real = dotacion
      dotacion_real[0] = dotacion_real[0].gsub("[", "")
      matriz_dotacion_real = []

      for i in 0..dotacion_real.length-1
        dotacion = dotacion_real[i].to_s.split("] ")[0]
        dotacion_cantidad = dotacion_real[i].to_s.split("] ")[1]
        coordenadas = dotacion.to_s.split(",")
        matriz_dotacion_real[i] = {:turno => coordenadas[0], :x => coordenadas[1], :y => coordenadas[2], :cantidad => dotacion_cantidad}
      end

      #//////////////////////////////////////////////////////////////////
      #// sumatoria de turnos real para imprimir en la gráfica
      #//////////////////////////////////////////////////////////////////

      dia = 0 #// maximo  plan.datos.num_dias_ventana
      hora = 0 #// máximo plan.datos.num_horas_dia

      sumatoria_turnos_real = Array.new((plan["datos"]["num_dias_ventana"] * plan["datos"]["num_horas_dia"]).to_i) { |i| i = 0 }

      for i in 0..matriz_turnos_in.length-1
        hora_turno = matriz_turnos_in[i]
        coordenada = ((hora_turno[:dia].to_i-1) * 10 + (hora_turno[:hora]).to_i) - 1

        for j in 0..matriz_dotacion_real.length-1
          if matriz_dotacion_real[j][:turno] == matriz_turnos_in[i][:turno]
            sumatoria_turnos_real[coordenada] += (matriz_dotacion_real[j][:cantidad] ).to_i
          end
        end
      end
      #/////////////////////////////////////////////////////////////////
    else
      sumatoria_turnos_real = ""
    end
    return sumatoria_turnos_real
  end


  def cerebro_sumatoria_turnos_diaria(plan)
    if plan.length != 0
      plan = JSON.parse(plan)
      num_dias_ventana = plan["datos"]["num_dias_ventana"].to_i
      turnosSumatoria = Array.new(num_dias_ventana) { |i| i = 0 }

      dotacion = plan["datos"]["dotacion_real"].to_s.split(", [")

      totalTurnosReales = total_turnos(plan, dotacion)

      diaSemana = 1
      horasDiarias = 10
      num_horas_dia_in = plan["datos"]["num_horas_dia"]
      count = 1;
      diaMes = 0;

      countDia = 1;

      for i in 0..turnosSumatoria.length-1
        turnosSumatoria[i] = 0
      end

      for i in 0..totalTurnosReales.length-1
        turnosSumatoria[diaMes] += (totalTurnosReales[i]).to_i
        if countDia < num_horas_dia_in
          countDia += 1
        else
          countDia = 1
          diaMes += 1
        end
      end
    else
      turnosSumatoria = ""
    end

    turnosSumatoria
  end

  def cerebro_sumatoria_turnos_optimizado(plan, id_case)


    if plan.length != 0
      plan = JSON.parse(plan)
      num_dias_ventana = plan["datos"]["num_dias_ventana"].to_i
      turnosSumatoria = Array.new(num_dias_ventana) { |i| i = 0 }


      # calcular turnos cubiertos
      summaryCase = SummaryCase.where(data_case: id_case, type_io: "out").first
      if summaryCase
        opt_turn = summaryCase.real_dot.tr('{', '').tr(' ','').tr('}', '').split(%r{,\s*})
      else
        opt_turn = []
      end
      turnosOptimizados = Array.new(12, 0)

      opt_turn.each do |turn|
        turn = turn.split(":")
        turnosOptimizados[turn[0].to_i-1] = turn[1].to_i
      end

      count = 1
      dotacion = []
      turnosOptimizados.each do |turno|
        dotacion << "#{count},1,1] #{turno}"
        count += 1
      end


      totalTurnosReales = total_turnos(plan, dotacion)
      #asd
      #cuadrar dotaciones reales con optimizadas.
      diaSemana = 1
      horasDiarias = 12
      num_horas_dia_in = plan["datos"]["num_horas_dia"]
      count = 1;
      diaMes = 0;

      countDia = 1;

      for i in 0..turnosSumatoria.length-1
        turnosSumatoria[i] = 0
      end

      for i in 0..totalTurnosReales.length-1
        turnosSumatoria[diaMes] += (totalTurnosReales[i]).to_i
        if countDia < num_horas_dia_in
          countDia += 1
        else
          countDia = 1
          diaMes += 1
        end
      end
    else
      turnosSumatoria = ""
    end

    return turnosSumatoria
  end


  def cerebro_sumatoria_turnos_entrada(plan, id_case)
    if plan.length != 0
      plan = JSON.parse(plan)
      num_dias_ventana = plan["datos"]["num_dias_ventana"].to_i
      turnosSumatoria = Array.new(num_dias_ventana) { |i| i = 0 }


      # calcular turnos cubiertos
      summaryCase = SummaryCase.where(data_case: id_case, type_io: "in").first


      if summaryCase
        opt_turn = summaryCase.real_dot.tr('{', '').tr(' ','').tr('}', '').split(%r{,\s*})
      else
        opt_turn = []
      end
      turnosOptimizados = Array.new(12, 0)

      turnosOptimizados = opt_turn.map { |turno_dotacion| turno_dotacion.split(':')[1] }.map(&:to_i)


      count = 1
      dotacion = []
      turnosOptimizados.each { |turno|
        dotacion << "#{count},1,1] #{turno}"
        count += 1
      }

      totalTurnosReales = total_turnos(plan, dotacion)

      diaSemana = 1
      horasDiarias = 10
      num_horas_dia_in = plan["datos"]["num_horas_dia"]
      count = 1;
      diaMes = 0;

      countDia = 1;

      for i in 0..turnosSumatoria.length-1
        turnosSumatoria[i] = 0
      end

      for i in 0..totalTurnosReales.length-1
        turnosSumatoria[diaMes] += (totalTurnosReales[i]).to_i
        if countDia < num_horas_dia_in
          countDia += 1
        else
          countDia = 1
          diaMes += 1
        end
      end
    else
      turnosSumatoria = ""
    end

    return turnosSumatoria
  end

  def cerebro_calculo_productividades_week(plan, dotacion)
    prod_week = []

    (0..plan.length-1).each do |i|
      if dotacion[i] == nil
        #prod_week << (plan[i] / dotacion[0]).round
      else
        prod_week << (plan[i] / dotacion[i]).round
      end
    end
    return prod_week
  end


  def cerebro_calculo_productividades_month(plan, dotacion)
    prod_month = []
    if dotacion.sum > 0
      (0..plan.length-1).each do |i|
        prod_month << (plan[i] / dotacion[i]).round
      end
    end
    return prod_month
  end

  def dotacion_real(department, month, year)
    StaffingReal.where(store_id: 1, department_id: department, month: 5, year: year).order(:day).pluck(:count)
  end

  def day_now(year, month)

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
        if Date.today.strftime('%d-%m-%Y').to_s == Date.commercial(@year.to_i,@week.to_i,d).strftime('%d-%m-%Y')
          result = { :day => d, :week => weekSet }
        end
      end
      weekSet += 1
    end
    return result
  end

  def day_now_charged
    last_sale = SellerSale.last
    { day: last_sale.day, week: last_sale.week }
  end

  #calcula los turnos cubiertos entregando un array con turnos entrada, salida, cubiertos y faltantes
  def shifts_covered(id_case, department, store)
    turnosOptimizados = Array.new(12, 0)
    turnosEntrada = Array.new(12, 0)
    turnosNoCubiertos = Array.new(12, 0)
    opt_turn = []
    #turnos de entrada
    sellers = Seller.where(department: department, store: store).pluck(:assigned_shift)
    sellers.each do |turn|
      turnosEntrada[turn.to_i-1] += 1
    end
    #turnos de salida
    summaryCaseOut = DataCase.find(id_case).summary_case_output
    if summaryCaseOut
      opt_turn = summaryCaseOut.real_dot.tr('{', '').tr(' ','').tr('}', '').split(%r{,\s*})
    else
      opt_turn = []
    end
    opt_turn.each do |turn|
      turn = turn.split(":")
      turnosOptimizados[turn[0].to_i-1] = turn[1].to_i
    end
    #calcular turnos cubiertos y no cubiertos
    turnosOpTotal = turnosOptimizados.sum
    turnosOpId = []

    for i in 0..turnosOptimizados.length - 1
      if turnosOptimizados[i] - turnosEntrada[i] > 0
        turnosOpTotal = turnosOpTotal - (turnosOptimizados[i] - turnosEntrada[i])
        turnosNoCubiertos[i + 1] = turnosOptimizados[i] - turnosEntrada[i]
      end
      if turnosOptimizados[i] != 0
        turnosOpId << i + 1
      end
    end
    {
      turnosEntrada:     turnosEntrada,
      turnosOptimizados: turnosOptimizados,
      departamento:      department,
      turnosOpTotal:     turnosOpTotal,
      turnosNoCubiertos: turnosNoCubiertos,
      turnosOpId:        turnosOpId
    }
  end

  def matrix_calc(prod_obj, prod_real, staff)
    exceso = 0
    faltante = 0
    matrixSet = []

    (prod_real.length).times do |i|

      if prod_real[i] == 0

        calculo = 0

      else
        # cálculo eficiencia
        # en prod_real debería venir horas y no días
        # 3 vendedores porque estamos en una sola hora
        # eficiencia = -((((  100000 - 85000  ) * 3 ) / 85000)).round
        # eficiencia = -(( 45000 / 85000)).round
        # eficiencia = - 0.5294
        # eficiencia = - 1
        desvio = -((((prod_real[i] - prod_obj) * staff[i]) / prod_obj))
        if desvio >= 0
          exceso += desvio
        else
          faltante += desvio
        end

      end

      matrixSet << desvio

    end

    data = {:exceso => exceso, :faltante => -faltante, :matrixSet => matrixSet }

    return data
  end
end
