class DashboardController < ApplicationController
  include FilterParameters
  include Statistics
  # before_action :set_params, only: %i[index report]
  # before_action :set_store_department, only: %i[index]
  # before_action :index_data, :index

  def index
    @store = current_user.store
    # @month = params[:month] || demo_data[:date].month
    # @store = demo_data[:store]
    # @department  = demo_data[:department]
    # @search      = demo_data[:search]
    # @stores      = Store.where(id: demo_data[:store]).order(:id)
    # @departments = Department.where(id: demo_data[:department]).order(:id)
    # @year  = Date.today.year
    # # dayNow = day_now_charged
    # turnos = Array.new(12, 0)

    # dataCase = DataCase.where(dep_num: demo_data[:department], month: @month).first
    # summaryCaseOut = SummaryCase.where(id_case: dataCase.id_case, type_io: 'out').first if dataCase

    # shifts = Statistics::seller_shifts(@store_department, filter_params)

    # #turnos cubiertos
    # if @data_case
    #   shifts_covered_data = shifts_covered(@data_case.id, @department.id, @store.id)
    #   turnosOpTotal = shifts_covered_data[:turnosOpTotal]
    #   @turnosEntrada = shifts_covered_data[:turnosEntrada]
    #   @turnosOptimizados = shifts_covered_data[:turnosOptimizados]
    # end

    # @sellers = @store.sellers.by_department(@department)

    # @setSellers = []
    # @planVentaTotal = 0
    # @ventaTotal = 0

    # @sellers.each do |seller|
    #   seller_plan = seller_staffing(@store, seller, params)
    #   plan = 0
    #   seller_plan.flatten.each_with_index do |plan_, index|
    #     plan += plan_[index + 1][:seller_plan_per_day].sum
    #   end
    #   sale = sale_real_per_seller(seller, @year, @month)
		# 	cumplimiento = ((sale.to_f / plan.to_f) * 100).round(2)
    #   @setSellers << { :seller => seller,
    #             :sale => setNum(sale),
    #             :plan => setNum(plan),
    #             :cumplimiento => cumplimiento }
    #   @planVentaTotal += plan
    #   @ventaTotal += sale

    #   binding.pry
    # end
    # total_real_sales = @store.real_sales.total_sales(@department, @month).to_f
    # total_plan_sales = @store.plan_sales.total_sales(@department, @month).to_f

		# @turnos_cubiertos = []
		# if @turnosOptimizados
		# 	if @turnosOptimizados.sum != 0
		# 		@turnos_cubiertos = { :texto => " #{turnosOpTotal} de #{@turnosOptimizados.sum}", :porcentaje => ( turnosOpTotal* 100 / @turnosOptimizados.sum).round }
		# 	else
		# 		@turnos_cubiertos = { :texto => " #{turnosOpTotal} de #{@turnosOptimizados.sum}", :porcentaje => 0 }
		# 	end
    # end

		# # calcular cumplimiento del plan
		# ventaTotal = SaleBySeller.where(month: @month, department: @department, year: @year).sum("sale").to_f
		# if summaryCaseOut
		# 	planVenta = summaryCaseOut.sale_plan.to_f
    #   @cumplimientoPlan = (@ventaTotal / @planVentaTotal * 100).round(1)
		# else
		# 	planVenta = 0
		# 	@cumplimientoPlan = 0
		# end
		# #obtener productividad real
		# dotReal = dotacion_real(@department, @month, @year)

    # #obtener ventas reales del mes
    # sale_reals = SaleReal.where(department_id: @department, store_id: @store, year: @year, month: @month)
    # @realMonth = []
		# @totalMonth = []
		# @contReal = 0

    # if dotReal.length > 0
    #   sale_reals.each do |sale|
    #     totalRealDay = sale[:nine]+sale[:ten]+sale[:eleven]+sale[:twelve]+sale[:thirteen]+sale[:fourteen]+sale[:fifteen]+sale[:sixteen]+sale[:seventeen]+sale[:eighteen]+sale[:nineteen]+sale[:twenty]+sale[:twenty_one]+sale[:twenty_two]+sale[:twenty_three]+sale[:twenty_four]
    #     @realMonth  << totalRealDay
    #     @totalMonth << (totalRealDay.to_f / dotReal[@contReal]).round
    #     @contReal += 1
    #   end
    # end

    # @cumplimientoPlan = (total_real_sales / total_plan_sales * 100).round(1)

    # excesoReal = matrix_calc(@target_productivity, @average_sale_by_day, @staff_by_day)
    # totalHour = (@sales_by_day.sum / @target_productivity)
    # # eficiencia
    # @efficiency = (1 - ((excesoReal[:exceso] + excesoReal[:faltante]) / totalHour)).round(2) * 100
	end

	def sale_real_per_seller(seller,year,month)
      @dep   = seller.department.id
      SaleBySeller.where(month: month, seller: seller.id, department: @dep, year: year).sum("sale")
  end
end
