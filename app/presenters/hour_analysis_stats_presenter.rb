class HourAnalysisStatsPresenter < StatsPresenter
  def call(data, label_period)
    {
      chart: chart(data, label_period),
      # chart_summary: chart_summary(data),
      # summary_tables: summary_tables(data)
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
