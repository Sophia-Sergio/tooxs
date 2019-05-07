class HourAnalysisStatsPresenter < StatsPresenter
  PRODUCTIVITY_TABLE_TITLES = ['HH', 'Productividad', 'Horas Faltants', 'Horas Exceso'].freeze

  def call(data, label_period)
    {
      chart: chart(data, label_period),
      summary_tables: summary_tables(data)
    }
  end

  def chart(data, label_period)
    {
      labels: dates_peridiocity(label_period, chart_period),
      datasets: [
        {
          label: data[:real_or_planned][:label],
          data: data[:real_or_planned][:data].values.map { |v| v.round(2) }
        },
      ]
    }
  end

  def summary_tables(data)
    {
      datasets: {
        planned: planned_summary_table(data)
      }
    }
  end

  def planned_summary_table(data)
    {
      title: PRODUCTIVITY_TABLE_TITLES,
      rows: {
        label: 'Productividad según plan', data: [
          data[:planned_hours].values.sum,
          data[:planned_productivity]
        ]
      },
      currency: false
    }
  end

  def chart_summary(data)
    no_optimized = (data[:no_optimized].values.sum / data[:no_optimized].values.count).round
    target = (data[:target].values.sum / data[:target].values.count).round
    optimized = (data[:optimized].values.sum / data[:optimized].values.count).round
    [
      { label: LABEL[:no_optimized], data: "$#{number_with_delimiter(no_optimized)}" },
      { label: LABEL[:target], data: "$#{number_with_delimiter(target)}" },
      { label: LABEL[:optimized], data: "$#{number_with_delimiter(optimized)}" }
    ]
  end
end
