class ProductivityStatsPresenter < StatsPresenter
  WEEK_PERIODS = Settings.productivity_week_periods_keys
  LABELS = {
    no_optimized: 'Productividad Sin Optimizar',
    target: 'Productividad Ideal',
    optimized: 'Productividad Optimizada'
  }.freeze

  def call(data, label_period)
    {
      chart: chart(data, label_period),
      chart_summary: chart_summary(data),
      table_summary: table_summary(data)
    }
  end

  def chart(data, label_period)
    {
      labels: dates_peridiocity(label_period, chart_period),
      datasets: [
        { label: LABELS[:no_optimized], data: data[:no_optimized].values },
        { label: LABELS[:target], data: data[:target].values },
        { label: LABELS[:optimized], data: data[:optimized].values }
      ]
    }
  end

  def chart_summary(data)
    [
      { label: LABELS[:no_optimized], data: data[:no_optimized].values.sum / data[:no_optimized].values.count },
      { label: LABELS[:target], data: data[:target].values.sum / data[:target].values.count },
      { label: LABELS[:optimized], data: data[:optimized].values.sum / data[:optimized].values.count }
    ]
  end

  def table_summary(data)
    plan_sales = @model.categories_sales_plan_by_dates(@period)
    hourly_staff = @model.hourly_staff_by_date(@period)
    {
      datasets: [
        { label: LABELS[:no_optimized], data: summary_table_avg_values(data[:no_optimized]) },
        { label: LABELS[:target], data: summary_table_avg_values(data[:target]) },
        { label: LABELS[:optimized], data: summary_table_avg_values(data[:optimized]) },
        { label: 'Plan de Ventas', data: summary_table_values(plan_sales) },
        { label: 'Dotación Semanal HH', data: summary_table_values(hourly_staff) }
      ]
    }.merge(summary_table_titles_json(data[:no_optimized].keys))
  end
end
