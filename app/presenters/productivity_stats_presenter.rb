class ProductivityStatsPresenter < StatsPresenter
  LABEL = {
    no_optimized: 'Productividad Sin Optimizar',
    target: 'Productividad Ideal',
    optimized: 'Productividad Optimizada',
    sales_plan: 'Ventas Plan',
    staff_hh: 'Dotación Semanal (HH)'
  }.freeze

  def call(data, label_period)
    {
      chart: chart(data, label_period),
      chart_summary: chart_summary(data),
      summary_tables: summary_tables(data)
    }
  end

  def chart(data, label_period)
    {
      labels: dates_peridiocity(label_period, chart_period),
      datasets: [
        { label: LABEL[:no_optimized], data: data[:no_optimized].values.map(&:round) },
        { label: LABEL[:target], data: data[:target].values },
        { label: LABEL[:optimized], data: data[:optimized].values }
      ]
    }
  end

  def chart_summary(data)
    no_optimized = 0
    target = 0
    optimized = 0
    no_optimized = (data[:no_optimized].values.sum / data[:no_optimized].values.count).round unless data[:no_optimized].values.empty?
    target = (data[:target].values.sum / data[:target].values.count).round unless data[:target].values.empty?
    optimized = (data[:optimized].values.sum / data[:optimized].values.count).round unless data[:optimized].values.empty?
    [
      { label: LABEL[:no_optimized], data: "$#{number_with_delimiter(no_optimized)}" },
      { label: LABEL[:target], data: "$#{number_with_delimiter(target)}" },
      { label: LABEL[:optimized], data: "$#{number_with_delimiter(optimized)}" }
    ]
  end

  def summary_tables(data)
    plan_sales = @model.categories_sales_plan_by_dates(@period)
    hourly_planend_staff = @model.hourly_planned_staff_by_date(@period)
    # dummy data
    hourly_optimized_staff = hourly_planend_staff.each_with_object({}) do |(date, staff), hash|
      hash[date] = staff - rand(10..20)
    end
    # dummy data
    {
      datasets: {
        sales_plan: [
          { label: LABEL[:sales_plan], data: summary_table_values(plan_sales), currency: true }
        ],
        no_optimized: [
          { label: LABEL[:staff_hh], data: summary_table_values(hourly_planend_staff), currency: false },
          { label: LABEL[:no_optimized], data: summary_table_avg_values(data[:no_optimized]), currency: true }
        ],
        optimized: [
          { label: LABEL[:staff_hh], data: summary_table_values(hourly_optimized_staff), currency: false },
          { label: LABEL[:optimized], data: summary_table_avg_values(data[:optimized]), currency: true }
        ]
      }
    }.merge(summary_table_titles_json(data[:no_optimized].keys))
  end
end
