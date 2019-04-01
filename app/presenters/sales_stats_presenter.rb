class SalesStatsPresenter < StatsPresenter
  def chart(sales, label_period)
    label_period = sales[:categories_plan_sales_by_dates].keys if chart_period == 'monthly'
    {
      labels: dates_peridiocity(label_period, chart_period),
      datasets: [
        { label: 'Real', data: values_peridiocity(sales[:sales], chart_period) },
        { label: 'Histórico', data: values_peridiocity(sales[:last_year_sales], chart_period) },
        { label: 'Plan', data: values_peridiocity(sales[:categories_plan_sales_by_dates], chart_period) }
      ]
    }
  end

  def compared_stores_chart(sales, label_period)
    label_period = sales[:actual_store_sales].keys if chart_period == 'monthly'
    actual_store_sales = values_peridiocity(sales[:actual_store_sales], chart_period)
    {
      labels: dates_peridiocity(label_period, chart_period),
      datasets: [
        { label: @model.store.name, data: actual_store_sales }
      ] + compared_stores_common(sales[:compared_stores], 'periodicity')
    }
  end

  def compared_stores_summary(sales, full_period)
    period = (full_period[:start]..full_period[:end]).to_a
    titles = summary_table_titles_json(period)
    actual_store = fill_with_zeros(titles[:title], summary_table_values(sales[:actual_store_sales]))
    {
      datasets: [
        { label: @model.store.name, data: actual_store }
      ] + compared_stores_common(sales[:compared_stores], 'summary', titles[:title])
    }.merge(titles)
  end

  def compared_stores_common(sales, type, titles = [])
    sales.each_with_object([]) do |store_department, array|
      if type == 'summary'
        store_dep_sales = summary_table_values(store_department[:sales])
        fill_with_zeros(titles, store_dep_sales)
      elsif type == 'periodicity'
        store_dep_sales = values_peridiocity(store_department[:sales], chart_period)
      end
      array << { label: store_department[:name], data: store_dep_sales }
    end
  end

  def summary(sales)
    plan = summary_table_values(sales[:categories_plan_sales_by_dates])
    real = fill_with_zeros(plan, summary_table_values(sales[:sales]))
    historic = summary_table_values(sales[:last_year_sales])
    {
      datasets: [
        { label: 'Real', data: real },
        { label: 'Histórico', data: historic },
        { label: 'Plan', data: plan }
      ],
      compared_datasets: [
        { label: 'Real vs Plan', data: data_vs(real, plan) },
        { label: 'Real vs Histórico', data: data_vs(real, historic) }
      ]
    }.merge(summary_table_titles_json(sales[:categories_plan_sales_by_dates].keys))
  end

  private

  def fill_with_zeros(supposed_bigger, supposed_minor)
    if supposed_bigger.length > supposed_minor.length
      (supposed_bigger.length - supposed_minor.length).times { supposed_minor << 0 }
    end
    supposed_minor
  end

  def data_vs(data, divided_by)
    data.zip(divided_by).map do |elements|
      number_to_percentage((elements[0].to_f / elements[1] - 1).round(3) * 100, precision: 2)
    end
  end
end
