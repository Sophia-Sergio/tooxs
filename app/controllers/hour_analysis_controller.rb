class HourAnalysisController < ApplicationController
  before_action :set_store, only: %i[index data]

	def index
    @search       = ''
    @stores       = Store.all.order(:id)
    @departments  = Department.all.order(:id)

    month  = params[:month].to_i
    year   = params[:year].to_i
    @dep   = params[:department].to_i

    #obtener ventas reales del mes
    sale_reals = SaleReal.where(department_id: @dep, store_id: @store.id, year: year, month: month)
    @realMonth = []

    sale_reals.each do |sale|
    totalRealDay = sale[:nine]+sale[:ten]+sale[:eleven]+sale[:twelve]+sale[:thirteen]+sale[:fourteen]+sale[:fifteen]+sale[:sixteen]+sale[:seventeen]+sale[:eighteen]+sale[:nineteen]+sale[:twenty]+sale[:twenty_one]+sale[:twenty_two]+sale[:twenty_three]+sale[:twenty_four]
    @realMonth << totalRealDay
    end

    @data = data
    @brain_json = brain_json(month, year, @store.id, @dep)
    dataCase = DataCase.where(month: month, year: year, dep_num: @dep)

    @venta_w_real = calculo_semanal(@realMonth, 7)
    #limitación para muestra
    @venta_w_real.delete_at(4) if @venta_w_real.length > 4

    @plan = JSON.parse(@brain_json) if @brain_json
    dotReal = dotacion_real(@dep, month, year)
    if dataCase.length > 0
      @dotacion_w_op = calculo_semanal(cerebro_sumatoria_turnos_optimizado(@brain_json, dataCase.first[:id_case]), 7)
    else
      @dotacion_w_op = []
    end
    @dotacion_w_real = calculo_semanal(dotReal, 7)

    @prod_w_op = cerebro_calculo_productividades_week(@venta_w_real, @dotacion_w_op)
    @prod_w_real = cerebro_calculo_productividades_week(@venta_w_real, @dotacion_w_real)

    @plan_w_total = []
    @plan_w_total << { :type => "op", :name => "Productividad optimizada", :plan_w => @venta_w_real, :dot_w => @dotacion_w_op, :prod_w => @prod_w_op }
    @plan_w_total << { :type => "real", :name => "Productividad real", :plan_w => @venta_w_real, :dot_w => @dotacion_w_real, :prod_w => @prod_w_real }
	end

  def data
    month  = params[:month]
    year   = params[:year]
    department = params[:department]
    sale_plans = @store.sale_plans.by_year_and_month(year, month).by_department(department)
    first_day_of_weeks = sale_plans.dates_by_week(1)
    total_sales_of_week = sale_plans.sales_by_week

    #obtener ventas reales del mes
    sale_reals = SaleReal.where(department_id: department, store_id: @store.id, year: year, month: month)
    @totalMonth = []
    @realMonth = []
    @dotMonth = []

    sale_reals.each do |sale|
        totalRealDay = sale[:nine]+sale[:ten]+sale[:eleven]+sale[:twelve]+sale[:thirteen]+sale[:fourteen]+sale[:fifteen]+sale[:sixteen]+sale[:seventeen]+sale[:eighteen]+sale[:nineteen]+sale[:twenty]+sale[:twenty_one]+sale[:twenty_two]+sale[:twenty_three]+sale[:twenty_four]
        totalDotDay = staffing[("#{sale[:sale_date].strftime("%Y%m%d")}").to_sym][:hours].values.sum
        @realMonth  << totalRealDay
        @dotMonth   << totalDotDay
        @totalMonth << (totalRealDay.to_f / totalDotDay.to_f).round
    end
    {
      dates_week: first_day_of_weeks[1],
      dates_week_2: first_day_of_weeks[1],
      dates_week_3: first_day_of_weeks[1],
      dates_week_4: first_day_of_weeks[1],
      :spm1 => total_sales_of_week.values.flatten,
      :tsm1 => @totalMonth,
      :vrm1 => @realMonth,
      :vent_real => @realMonth.sum,
      :dot_real => @dotMonth.sum
    }
  end
  private

  def set_store
    @store = Store.find(params[:store])
  end
end
