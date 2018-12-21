class DashboardController < ApplicationController
  include FilterParameters
  include Statistics
  before_action :set_params, only: %i[index report]
  before_action :set_store_department, only: %i[index]
  before_action :index_data, :index

  def index

    shifts = Statistics::seller_shifts(@store_department, filter_params)

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
      seller_plan = seller_staffing(@store, seller, params)
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

      binding.pry
    end
    total_real_sales = @store.real_sales.total_sales(@department, @month).to_f
    total_plan_sales = @store.plan_sales.total_sales(@department, @month).to_f

		@turnos_cubiertos = []
    if @turnosOptimizados
      if @turnosOptimizados.sum != 0
        @turnos_cubiertos = { :texto => " #{turnosOpTotal} de #{@turnosOptimizados.sum}", :porcentaje => ( turnosOpTotal* 100 / @turnosOptimizados.sum).round }
      else
        @turnos_cubiertos = { :texto => " #{turnosOpTotal} de #{@turnosOptimizados.sum}", :porcentaje => 0 }
      end
    end

    @cumplimientoPlan = (total_real_sales / total_plan_sales * 100).round(1)

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
    @staff = @store_department.real_staffs.staff_by_day(params[:month], params[:year]).values
    @sales = @store_department.real_sales.sales_by_day(params[:month], params[:year])
    @average_sales = @sales.zip(@staff).map { |sale| (sale[0] / sale[1].to_f).round(2) }
    @real_productivity = (@sales.sum / @staff.sum).round(2)
    @target_productivity = @data_case.target_productivity.to_f
  end

  def filter_params
    params.permit(:year, :month, :store, :department, :encrypted_password)
  end

  def set_store_department
    @store_department = StoreDepartment.find_by(store: params[:store],
                                                department: params[:department])
  end
end
