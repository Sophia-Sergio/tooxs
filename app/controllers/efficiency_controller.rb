class EfficiencyController < ApplicationController
  include FilterParameters
  before_action :set_params, only: %i[index report]
  before_action :set_store, only: %i[index]
  before_action :set_department, only: %i[index]

  def index
    @stores       = Store.all.order(:id)
    @departments  = Department.all.order(:id)
    @search = ""
    @month = params[:month_init] || demo_data[:date].month
    @month_fin = params[:month_fin] || demo_data[:date].month.to_i + 3
  end

  def report
    @month = params[:month_init]
    @month_fin = params[:month_fin]
    data = {:fecha => [], :prod_w_real => [], :prod_w_op => []}
    (@month..@month_fin).each do |month|
      month_data = report_data(@department, @store, @year, month)
      if month_data
        data[:fecha] = data[:fecha] + month_data[:fecha]
        data[:prod_w_real] = data[:prod_w_real] + month_data[:prod_w_real]
        data[:prod_w_op] = data[:prod_w_op] + month_data[:prod_w_op]
      end
    end
    render json: data
  end


  def report_data department, store, year, month
    data_case = DataCase.where(department: department, month: month).first
    if data_case
      prod_obj = data_case.target_productivity.to_f
      #obtener ventas reales del mes
      real_sales = RealSale.where(department: department, store: store, year: year, month: month)
      real_month = []
      total_month = []
      total_op_month = []
      opMonth = []
      prod_w_real = []
      prod_w_op = []
      fecha = []
      cont_real = 0
      cont_op = 0
      date_month = []
      #obtener productividad real
      params[:month] = month
      dotReal = RealStaff.staff_by_day(filter_params)
      if dotReal.length > 0
        real_sales.each do |sale|
          total_real_day = sale.total_day
          date_month << sale[:sale_date].strftime('%d-%m').to_sym
          real_month  << total_real_day
          total_month << (total_real_day.to_f / dotReal[cont_real]).round
          cont_real += 1
        end
      end
      # excess of hours with real endowment
      realExcess = matrix_calc(prod_obj, total_month, dotReal)
      realExcess[:matrixSet].each_with_index do |excess, index|
        percentDesviation = (((dotReal[index] + excess).to_f / dotReal[index].to_f)).round(4) * 100
        if percentDesviation > 100
          prod_w_real << 100 - ( percentDesviation - 100)
        elsif percentDesviation < 100 and percentDesviation > 0
          prod_w_real << percentDesviation
        else
          prod_w_real << percentDesviation
        end
        fecha << index + 1
      end
      # excess hours with optimized endowment
      brain_json = brain_json(month, year, store, department)
      plan = JSON.parse(brain_json)
      dotacion_op = cerebro_sumatoria_turnos_optimizado(brain_json, data_case[:id_case])
      if dotacion_op.length > 0
        real_sales.each do |sale|
          if dotacion_op[cont_op] == nil
            opMonth  << 0
            total_op_month << 0
            cont_op += 1
          else
            # eficiencia debería estar definida por hora
            total_real_day = sale.total_day
            opMonth  << total_real_day
            total_op_month << (total_real_day.to_f / dotacion_op[cont_op]).round
            cont_op += 1
          end
        end
      end
      opExcess = matrix_calc(prod_obj, total_op_month, dotacion_op)
      opExcess[:matrixSet].each_with_index do |excess, index|
        if dotacion_op[index] == nil
          percentDesviation = 0
        else
          percentDesviation = (((dotacion_op[index] + excess).to_f / dotacion_op[index].to_f)).round(4) * 100
        end

        if percentDesviation > 100
          prod_w_op << 100 - ( percentDesviation - 100)
        elsif percentDesviation < 100 and percentDesviation > 0
          prod_w_op << percentDesviation
        else
          prod_w_op << percentDesviation
        end
      end
      data = { :fecha => date_month, :prod_w_real => prod_w_real,  :prod_w_op => prod_w_op }
    end
  end
end
