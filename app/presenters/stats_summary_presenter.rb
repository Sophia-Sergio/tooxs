class StatsSummaryPresenter < SimpleDelegator
  include ActionView::Helpers::NumberHelper
  include Statistics::Defaults

  def initialize(model, period)
    @model = model
    @period = period
    super(@model)
  end

  def efficiency(period)
    {
      name: 'CUMPLIMIENTO DE EFICIENCIA',
      value: "#{@model.efficiency(period).round(2)}%",
      description: "Eficiencia Objetivo 75%"
    }
  end

  def efficiency_statistics
    {
      goal_success: goal_success(@period),
      productivity: productivity(@period),
      efficiency: efficiency(@period)
    }
  end

  def goal_success(period)
    opts = {
      month: Settings.month_by_date(period[:start]),
      year: Settings.year_by_date(period[:start])
    }
    plan_sales = @model.categories_plan_sales(opts)
    sales = @model.categories_sales(period)
    {
      name: 'CUMPLIMIENTO PLAN DE VENTA',
      value: "#{((sales / plan_sales.to_f) *100 ).round(2)}%",
      description: "Plan $#{number_with_delimiter(plan_sales.round)}. Real $#{number_with_delimiter(sales.round)}"
    }
  end

  def productivity(period)
    plan_sales = @model.categories_plan_sales(period)
    sales = @model.categories_sales(period)
    avg_target_productivity = @model.month_target_productivity(Settings.month_by_date(period[:start]))
    {
      name: 'CUMPLIMIENTO REAL',
      value: "$#{number_with_delimiter(@model.productivity(period).round)}",
      description: "Productividad Objetivo $#{number_with_delimiter(avg_target_productivity)}"
    }
  end
end
