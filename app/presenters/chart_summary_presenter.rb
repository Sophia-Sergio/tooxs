class ChartSummaryPresenter < StatsPresenter
  def efficiency
    {
      name: 'CUMPLIMIENTO DE EFICIENCIA',
      value: "#{@model.efficiency(@period).round(2)}%",
      description: 'Eficiencia Objetivo 75%'
    }
  end

  def chart
    {
      goal_success: goal_success,
      productivity: productivity,
      efficiency: efficiency
    }
  end

  def goal_success
    plan_sales = @model.categories_plan_sales(@period).values.sum.round
    sales      = @model.categories_sales(@period)
    {
      name: 'CUMPLIMIENTO PLAN DE VENTA',
      value: "#{((sales / plan_sales.to_f) * 100).round(2)}%",
      description: "Plan $#{number_with_delimiter(plan_sales)}. Real $#{number_with_delimiter(sales.round)}"
    }
  end

  def productivity
    avg_target_productivity = @model.year_month_target_productivity(
      year_by_date(@period[:start]), month_by_date(@period[:start]))
    {
      name: 'CUMPLIMIENTO REAL',
      value: "$#{number_with_delimiter(@model.productivity(@period).round)}",
      description: "Productividad Objetivo $#{number_with_delimiter(avg_target_productivity)}"
    }
  end
end
