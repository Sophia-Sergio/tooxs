class ProductivityStatsPresenter < StatsPresenter
  WEEK_PERIODS = Settings.productivity_week_periods_keys

  def chart(productivities)
    {
      chart_title_labels: dates_peridiocity(productivities[:real].keys, chart_period),
      datasets: [
        { label: 'Productividad Real', values: productivities[:real].values },
        { label: 'Productividad Ideal', values: productivities[:target].values },
        { label: 'Productividad Optimizada', values: productivities[:target].values }
      ]
    }
  end
end
