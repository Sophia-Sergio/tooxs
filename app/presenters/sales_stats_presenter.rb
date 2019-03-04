class SalesStatsPresenter < StatsPresenter
  def chart(sales)
    {
      labels: dates_peridiocity(sales[:sales].keys, chart_period),
      datasets: [
        { label: 'Real', data: values_peridiocity(sales[:sales], chart_period) },
        { label: 'Histórico', data: values_peridiocity(sales[:last_year_sales], chart_period) },
        { label: 'Plan', data: values_peridiocity(sales[:categories_plan_sales_by_dates], chart_period) }
      ]
    }
  end

  def compared_stores_chart(sales)
    actual_store_sales = values_peridiocity(sales[:actual_store_sales], chart_period)
    {
      labels: dates_peridiocity(sales[:actual_store_sales].keys, chart_period),
      datasets: [
        { label: @model.store.name, data: actual_store_sales }
      ] + compared_stores_common(sales[:compared_stores], 'periodicity')
    }
  end

  def compared_stores_summary(sales)
    {
      datasets: [
        { label: @model.store.name, data: summary_table_values(sales[:actual_store_sales]) },
      ] + compared_stores_common(sales[:compared_stores], 'summary')
    }.merge(summary_table_titles_json(sales[:actual_store_sales].keys))
  end

  def compared_stores_common(sales, type)
    sales.each_with_object([]) do |store_department, array|
      if type == 'summary'
        store_dep_sales = summary_table_values(store_department[:sales])
      elsif type == 'periodicity'
        store_dep_sales = values_peridiocity(store_department[:sales], chart_period)
      end
      array << { label: store_department[:name], data: store_dep_sales }
    end
  end

  def summary(sales)
    {
      datasets: [
        { label: 'Real', data: summary_table_values(sales[:sales]) },
        { label: 'Histórico', data: summary_table_values(sales[:last_year_sales]) },
        { label: 'Plan', data: summary_table_values(sales[:categories_plan_sales_by_dates]) }
      ]
    }.merge(summary_table_titles_json(sales[:sales].keys))
  end
end