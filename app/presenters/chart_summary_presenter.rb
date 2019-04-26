class ChartSummaryPresenter < StatsPresenter
  def efficiency_summary
    {
      label: 'EFICIENCIA',
      data: "#{@model.efficiency(@period).round(2)}%",
      description: 'Eficiencia Objetivo 75%'
    }
  end

  def efficiency
    [
      goal_success_summary,
      productivity_summary,
      efficiency_summary
    ]
  end

  def goal_success_summary
    plan_sales = @model.categories_sales_plan_by_dates(@period).values.sum.round
    sales      = @model.categories_sales(@period)
    {
      label: 'CUMPLIMIENTO PLAN DE VENTA',
      data: "#{((sales / plan_sales.to_f) * 100).round(2)}%",
      description: "Plan $#{number_with_delimiter(plan_sales)}. Real $#{number_with_delimiter(sales.round)}"
    }
  end

  def productivity_summary
    avg_target_productivity = @model.year_month_target_productivity(@period)
    {
      label: 'PRODUCTIVIDAD',
      data: "$#{number_with_delimiter(@model.productivity(@period).round)}",
      description: "Productividad Objetivo $#{number_with_delimiter(avg_target_productivity)}"
    }
  end
end
