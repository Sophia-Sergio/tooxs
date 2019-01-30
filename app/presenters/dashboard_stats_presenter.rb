class DashboardStatsPresenter < SimpleDelegator
  def initialize(model, view)
    @model = model.store_department if model.store_department
    @view = view
    super(@model)
  end

  def efficiency(opts = {})
    {
      name: 'CUMPLIMIENTO DE EFICIENCIA',
      value: @model.efficiency(opts),
      description: "Eficiencia Objetivo 75%"
    }
  end

  def dashboard_statistics(opts = {})
    opts ||= nil
    {
      first: efficiency(opts),
      second: goal_success(opts),
      third: productivity(opts),
    }
  end

  def goal_success(opts = {})
    plan_sales = @model.categories_plan_sales(opts)
    sales = @model.categories_sales(opts)
    {
      name: 'CUMPLIMIENTO PLAN DE VENTA',
      value: @model.goal_success(opts),
      description: "Plan $#{plan_sales}. Real $#{sales}"
    }
  end


end