# frozen_string_literal: true

class ProductivityController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_store, only: %i[show json_current]

  def show
    @search       = ''
    @stores       = Store.all.joins('INNER JOIN departments ON stores.id = departments.store_id INNER JOIN data_cases ON departments.id = data_cases.dep_num').distinct
    @departments  = Department.all.joins('INNER JOIN data_cases ON departments.id = data_cases.dep_num').distinct
    month  = params[:month]
    year   = params[:year]
    department = params[:department]
    first_day_of_weeks = @store.sale_plans.by_year_and_month(year, month)
                               .by_department(department).dates_by_week(1)

    @staffing_w1  = staffing_draw(first_day_of_weeks[1])
    @staffing_w2  = staffing_draw(first_day_of_weeks[2])
    @staffing_w3  = staffing_draw(first_day_of_weeks[3])
    @staffing_w4  = staffing_draw(first_day_of_weeks[4])
    @brain_json   = brain_json(month, year, @store.id, department)
  end

  def json_current
    month  = params[:month]
    year   = params[:year]
    department = params[:department]
    sale_plans = @store.sale_plans.by_year_and_month(year, month).by_department(department)
    days_by_week = sale_plans.days_by_week
    first_day_of_weeks = sale_plans.dates_by_week(1)
    total_sales_of_week = sale_plans.sales_by_week
    # obtener ventas reales del mes
    sale_reals = SaleReal.where(department_id: department, store_id: @store.id, year: year, month: month)
    @totalMonth = []
    @realMonth = []
    @contReal = 0
    dotReal = dotacion_real(department, month, year)

    unless dotReal.empty?
      sale_reals.each do |sale|
        totalRealDay = sale[:nine] + sale[:ten] + sale[:eleven] + sale[:twelve] + sale[:thirteen] + sale[:fourteen] + sale[:fifteen] + sale[:sixteen] + sale[:seventeen] + sale[:eighteen] + sale[:nineteen] + sale[:twenty] + sale[:twenty_one] + sale[:twenty_two] + sale[:twenty_three] + sale[:twenty_four]
        @realMonth  << totalRealDay
        @totalMonth << (totalRealDay.to_f / dotReal[@contReal]).round
        @contReal += 1
      end
    end
    # staffdrawing per day-week
    @sd_w1_daily  = staffing_draw(first_day_of_weeks[1])[:draw].values.map(&:flatten).transpose.map(&:sum)
    @sd_w2_daily  = staffing_draw(first_day_of_weeks[2])[:draw].values.map(&:flatten).transpose.map(&:sum)
    @sd_w3_daily  = staffing_draw(first_day_of_weeks[3])[:draw].values.map(&:flatten).transpose.map(&:sum)
    @sd_w4_daily  = staffing_draw(first_day_of_weeks[4])[:draw].values.map(&:flatten).transpose.map(&:sum)
    # productivity per day-week
    @prd_w1_day = total_sales_of_week[1].zip(@sd_w1_daily).map { |a, b| a / b }
    @prd_w2_day = total_sales_of_week[2].zip(@sd_w2_daily).map { |a, b| a / b }
    @prd_w3_day = total_sales_of_week[3].zip(@sd_w3_daily).map { |a, b| a / b }
    @prd_w4_day = total_sales_of_week[4].zip(@sd_w4_daily).map { |a, b| a / b }

    nombreTurnos = AvailableShift.all.where(month: month, store_id: 1).distinct.order(:num).pluck(:num, :name)
    @brain_json = brain_json(month, year, @store.id, department)
    @plan = JSON.parse(@brain_json)
    dataCase = DataCase.where(month: month, year: year, dep_num: department)
    @prod_obj = dataCase.first.prod_obj.to_i
    @dotacion_actual = cerebro_sumatoria_turnos_entrada(@brain_json, dataCase.first[:id_case])
    @dotacion_op = cerebro_sumatoria_turnos_optimizado(@brain_json, dataCase.first[:id_case])

    @prod_w_op = cerebro_calculo_productividades_month(total_sales_of_week.values.sum, @dotacion_op)
    @prod_w_real = cerebro_calculo_productividades_month(total_sales_of_week.values.sum, dotReal)
    @prod_w_actual = cerebro_calculo_productividades_month(total_sales_of_week.values.sum, @dotacion_actual)

    render json: {
      dates_week: days_by_week[1],
      dates_week_2: days_by_week[2],
      dates_week_3: days_by_week[3],
      dates_week_4: days_by_week[4],
      sp: total_sales_of_week[1],
      sd: @sd_w1_daily,
      prd: @prd_w1_day,
      prd1: @prd_w2_day,
      prd2: @prd_w3_day,
      prd3: @prd_w4_day,
      spm1: total_sales_of_week.values.flatten,
      tsm1: @totalMonth,
      vrm1: @realMonth,
      vent_real: @realMonth.sum,
      dot_real: dotReal.sum,
      nombreTurnos: nombreTurnos,
      prod_w_op: @prod_w_op,
      prod_w_real: @prod_w_real,
      prod_w_actual: @prod_w_actual,
      dot_month_real: dotReal,
      dot_month_op: @dotacion_op,
      dot_month_actual: @dotacion_actual,
      prod_obj: @prod_obj
    }
  end

  def get_real_dot
    turns      = AvailableShift.all
    turnsTotal = AvailableShift.distinct.pluck(:num)
    turns_matrix = ''
    turnsTotal.each do |i|
      turn = AvailableShift.where(num: i)
      j = 1
      turn.each do |s|
        s.eleven ? turns_matrix += " [#{i.to_i},1,#{j}] 1," : ''
        s.twelve ? turns_matrix += " [#{i.to_i},2,#{j}] 1," : ''
        s.thirteen ? turns_matrix += " [#{i.to_i},3,#{j}] 1," : ''
        s.fourteen ? turns_matrix += " [#{i.to_i},4,#{j}] 1," : ''
        s.fifteen ? turns_matrix += " [#{i.to_i},5,#{j}] 1," : ''
        s.sixteen ? turns_matrix += " [#{i.to_i},6,#{j}] 1," : ''
        s.seventeen ? turns_matrix += " [#{i.to_i},7,#{j}] 1," : ''
        s.eighteen ? turns_matrix += " [#{i.to_i},8,#{j}] 1," : ''
        s.nineteen ? turns_matrix += " [#{i.to_i},9,#{j}] 1," : ''
        s.twenty ? turns_matrix += " [#{i.to_i},10,#{j}] 1," : ''
        j += 1
      end
    end
    turns_matrix = turns_matrix.slice 1..-2
  end

  def data_month
    month = params[:month].to_i
    year = params[:year].to_i
    store = params[:store].to_i
    department = params[:department].to_i

    summary = ''
    dataCase = DataCase.where(month: month, year: year, dep_num: department)

    if dataCase.blank?
      summary = ''
      existe = false
      json_result = ''
    else
      returnCase = ReturnCase.where(id_case: dataCase.first[:id_case]).first
      if File.exist?(File.join(Rails.root, 'public', "caso#{dataCase.first[:id_case]}.txt"))
        File.open(File.join(Rails.root, 'public', "caso#{dataCase.first[:id_case]}.txt"), 'r') do |f1|
          while line = f1.gets
            line = "\n" if line == ''
            summary += line.to_s
          end
        end
        existe = true
        json_result = "{\"margen_eficiencia\":\"#{returnCase.eff_margin}\",\"excedente_total\":#{returnCase.total_surplus},\"costo_remuneracion\":#{returnCase.compensation_cost}, \"status\":\"#{returnCase.status}\",\"usuario\":\"#{returnCase.user}\",\"id_caso\":\"#{returnCase.id_case}\",\"mensaje\":\"#{returnCase.message}\", \"deficit_total\":#{returnCase.deficit_total},\"tolerancia\":\"#{returnCase.tolerance}\",\"version\":\"#{returnCase.version}\", \"formato_resultado\":{\"almuerzo\":\"[turno_i,departamento_j,período_t] valor, [...\", \"delta\":\"[departamento_j,período_t] valor, [...\"}, \"tiempo_maximo\":\"#{returnCase.max_time}\",\"resultado\":{\"almuerzos\":\"#{returnCase.lunchs}\",\"turnos\":\"#{returnCase.turns}\",\"delta\":\"#{returnCase.delta}\", \"epsilon\":\"#{returnCase.epsilon}\"},\"soporte\":\"fatapia@scipion.cl\",\"modelo\":\"#{returnCase.model}\",\"plan_venta\":#{returnCase.sales_plan}, \"funcion_objetivo\":#{returnCase.obj_function}}"
      else
        summary = ''
        existe = false
        json_result = ''
      end
    end

    @data = { existe: existe, summary: summary, json_result: json_result }
    render json: @data
  end

  def report
    @search       = ''
    @stores       = Store.all.order(:id)
    @departments  = Department.all.order(:id)

    month  = params[:month].to_i
    year   = params[:year].to_i
    @store = params[:store].to_i
    @dep   = params[:department].to_i
    # obtener ventas reales del mes
    sale_reals = SaleReal.where(department_id: @dep, store_id: @store, year: year, month: month)
    @realMonth = []

    sale_reals.each do |sale|
      totalRealDay = sale[:nine] + sale[:ten] + sale[:eleven] + sale[:twelve] + sale[:thirteen] + sale[:fourteen] + sale[:fifteen] + sale[:sixteen] + sale[:seventeen] + sale[:eighteen] + sale[:nineteen] + sale[:twenty] + sale[:twenty_one] + sale[:twenty_two] + sale[:twenty_three] + sale[:twenty_four]
      @realMonth << totalRealDay
    end

    @brain_json = brain_json(month, year, @store, @dep)
    dataCase = DataCase.where(month: month, year: year, dep_num: @dep)

    @venta_w_real = calculo_semanal(@realMonth, 7)

    @venta_w_real.delete_at(4) if @venta_w_real.length > 4 # limitación para muestra

    @plan = JSON.parse(@brain_json)

    dotReal = dotacion_real(@dep, month, year)
    if !dataCase.empty?
      @dotacion_w_op = calculo_semanal(cerebro_sumatoria_turnos_optimizado(@brain_json, dataCase.first[:id_case]), 7)
    else
      @dotacion_w_op = []
    end
    @dotacion_w_real = calculo_semanal(dotReal, 7)

    @prod_w_op = cerebro_calculo_productividades_week(@venta_w_real, @dotacion_w_op)
    @prod_w_real = cerebro_calculo_productividades_week(@venta_w_real, @dotacion_w_real)

    @plan_w_total = []
    @plan_w_total << { type: 'op', name: 'Productividad optimizada', plan_w: @venta_w_real, dot_w: @dotacion_w_op, prod_w: @prod_w_op }
    @plan_w_total << { type: 'real', name: 'Productividad real', plan_w: @venta_w_real, dot_w: @dotacion_w_real, prod_w: @prod_w_real }
  end

  def report_data
    # dummy demo data
    month = params[:month].to_i
    year = params[:year].to_i
    department = params[:department]
    @store = Store.find(params[:store])

    # days of the week for this query
    days_by_week = @store.sale_plans.by_year_and_month(year, month).by_department(department).days_by_week
    # obtener ventas reales del mes
    sale_reals = SaleReal.where(department_id: department, store_id: @store.id, year: year, month: month)
    @totalMonth = []
    @realMonth = []

    sale_reals.each do |sale|
      totalRealDay = sale[:nine] + sale[:ten] + sale[:eleven] + sale[:twelve] + sale[:thirteen] + sale[:fourteen] + sale[:fifteen] + sale[:sixteen] + sale[:seventeen] + sale[:eighteen] + sale[:nineteen] + sale[:twenty] + sale[:twenty_one] + sale[:twenty_two] + sale[:twenty_three] + sale[:twenty_four]
      totalDotDay = staffing[sale[:sale_date].strftime('%Y%m%d').to_s.to_sym][:hours].values.sum
      @realMonth  << totalRealDay
      @totalMonth << (totalRealDay.to_f / totalDotDay.to_f).round
    end

    @brain_json = brain_json(month, year, @store.id, department)
    dotReal = dotacion_real(department, month, year)
    @plan = JSON.parse(@brain_json)
    dataCase = DataCase.where(month: month, year: year, dep_num: department)

    @prod_obj = dataCase.first.prod_obj.to_i

    @dotacion_op = cerebro_sumatoria_turnos_optimizado(@brain_json, dataCase.first[:id_case])
    @dotacion_real = dotReal

    @prod_w_op = cerebro_calculo_productividades_month(@realMonth, @dotacion_op)
    @prod_w_real = cerebro_calculo_productividades_month(@realMonth, @dotacion_real)

    render json: {
      dates_week: days_by_week[1],
      dates_week_2: days_by_week[2],
      dates_week_3: days_by_week[3],
      dates_week_4: days_by_week[4],
      tsm1: @totalMonth,
      vrm1: @realMonth,
      prod_w_op: @prod_w_op,
      prod_w_real: @prod_w_real,
      prod_obj: @prod_obj
    }
  end

  def save_case
    dataCase = DataCase.where(id_case: params[:result][:id_caso].to_s).first
    dataCase = DataCase.find(dataCase.id)
    dataCase.sale_plan = params[:plan][:datos][:plan_venta]
    dataCase.save

    ReturnCase.where(id_case: params[:result][:id_caso]).destroy_all
    # guardar result
    returnCase = ReturnCase.create!(
      id_case: params[:result][:id_caso],
      eff_margin: params[:result][:margen_eficiencia],
      total_surplus: params[:result][:excedente_total],
      compensation_cost: params[:result][:costo_remuneracion],
      status: params[:result][:status],
      user: params[:result][:usuario],
      message: params[:result][:mensaje],
      deficit_total: params[:result][:deficit_total],
      tolerance: params[:result][:tolerancia],
      version: params[:result][:version],
      format_result: params[:result][:formato_resultado],
      max_time: params[:result][:tiempo_maximo],
      lunchs: params[:result][:resultado][:almuerzos],
      turns: params[:result][:resultado][:turnos],
      delta: params[:result][:resultado][:delta],
      epsilon: params[:result][:resultado][:epsilon],
      support: params[:result][:soporte],
      model: params[:result][:modelo],
      sales_plan: params[:result][:plan_venta],
      obj_function: params[:result][:funcion_objetivo]
    )

    # dotacion entrada
    turno_count = 1
    dot_in = '{'

    params[:turnos].each do |turno|
      if  turno.to_i < 12
        dot_in += "#{turno_count} : #{params[:turnos][turno][:vendedores]}, "
        turno_count += 1
      end
    end

    dot_in = dot_in.slice 0..-3
    dot_in += '}'

    SummaryCase.where(id_case: params[:result][:id_caso]).destroy_all

    summaryCase = SummaryCase.create!(
      id_case: params[:result][:id_caso],
      sale_plan: params[:resumen]['0'][:planVentas],
      coverange_deficit: params[:resumen]['0'][:deficitCobertura],
      surplus_coverange: params[:resumen]['0'][:ExcedenteCobertura],
      total_deviation: params[:resumen]['0'][:desviacionTotal],
      cost_of_remunerations: params[:resumen]['0'][:costoRemuneraciones],
      margin_adjustment: params[:resumen]['0'][:margeAjuste],
      type_io: 'in',
      real_dot: dot_in
    )

    # dotacion salida
    turno_count = 1
    dot_out = '{'

    params[:turnos].each do |turno|
      if  turno.to_i > 11
        dot_out += "#{turno_count} : #{params[:turnos][turno][:vendedores]}, "
        turno_count += 1
      end
    end

    dot_out = dot_out.slice 0..-3
    dot_out += '}'

    summaryCase = SummaryCase.create!(
      id_case: params[:result][:id_caso],
      sale_plan: params[:resumen]['1'][:planVentas],
      coverange_deficit: params[:resumen]['1'][:deficitCobertura],
      surplus_coverange: params[:resumen]['1'][:ExcedenteCobertura],
      total_deviation: params[:resumen]['1'][:desviacionTotal],
      cost_of_remunerations: params[:resumen]['1'][:costoRemuneraciones],
      margin_adjustment: params[:resumen]['1'][:margeAjuste],
      type_io: 'out',
      real_dot: dot_out
    )

    File.open(File.join(Rails.root, 'public', "caso#{params[:result][:id_caso]}.txt"), 'w') do |f2|
      f2.puts params[:salida]
    end

    render json: params
  end

  private

  def set_store
    @store = Store.find(params[:store])
  end
end
