class DashboardController < ApplicationController
  include DemoParameters
  before_action :index_data, :index

  def index
    #turnos cubiertos
    if @data_case
      shifts_covered_data = shifts_covered(@data_case.id, @department.id, @store.id)
      turnosOpTotal = shifts_covered_data[:turnosOpTotal]
      @turnosEntrada = shifts_covered_data[:turnosEntrada]
      @turnosOptimizados = shifts_covered_data[:turnosOptimizados]
    end

    @sellers = @store.sellers.by_department(@department)

    @setSellers = []
    @planVentaTotal = 0
    @ventaTotal = 0

    @sellers.each do |seller|
      seller_plan = seller_staffing(seller, @month, @year)
      plan = 0
      seller_plan.flatten.each_with_index do |plan_, index|
        plan += plan_[index + 1][:seller_plan_per_day].sum
      end
      sale = sale_real_per_seller(seller, @year, @month)
			cumplimiento = ((sale.to_f / plan.to_f) * 100).round(2)
      @setSellers << { :seller => seller,
                :sale => setNum(sale),
                :plan => setNum(plan),
                :cumplimiento => cumplimiento }
      @planVentaTotal += plan
      @ventaTotal += sale
    end

		@turnos_cubiertos = []
    if @turnosOptimizados
      if @turnosOptimizados.sum != 0
        @turnos_cubiertos = { :texto => " #{turnosOpTotal} de #{@turnosOptimizados.sum}", :porcentaje => ( turnosOpTotal* 100 / @turnosOptimizados.sum).round }
      else
        @turnos_cubiertos = { :texto => " #{turnosOpTotal} de #{@turnosOptimizados.sum}", :porcentaje => 0 }
      end
    end

    @cumplimientoPlan = (@ventaTotal / @planVentaTotal * 100).round(1)

    excesoReal = matrix_calc(@target_productivity, @average_sale_by_day, @staff_by_day)
    totalHour = (@sales_by_day.sum / @target_productivity)
    # eficiencia
    @efficiency = (1 - ((excesoReal[:exceso] + excesoReal[:faltante]) / totalHour)).round(2) * 100
	end

	def sale_real_per_seller(seller,year,month)
    @dep   = seller.department.id
    SellerSale.where(month: month, seller: seller, department: @dep, year: year).sum("sale")
  end

  private

  def index_data
    @year = params[:year] ||= demo_data[:date].year
    @month = params[:month] ||= demo_data[:date].month
    store = params[:store] ||= demo_data[:store]
    department = params[:department] ||= demo_data[:department]
    @store = Store.find(store)
    @department = Department.find(department)
    @staff_by_day = StaffingReal.staff_by_day(filter_params)
    @sales_by_day = @store.sale_reals.sales_by_day(@department, @month)
    @average_sale_by_day = @sales_by_day.zip(@staff_by_day).map { |sale_staff| (sale_staff[0] / sale_staff[1].to_f).round(2) }
    @real_productivity = (@sales_by_day.sum / @staff_by_day.sum).round(2)
    @data_case = DataCase.find_case(filter_params)
    @summary_case_out = @data_case.summary_case_output
    @target_productivity = @data_case.target_productivity.to_f
  end

  def filter_params
    params.permit(:year, :month, :store, :department, :encrypted_password)
  end
end
