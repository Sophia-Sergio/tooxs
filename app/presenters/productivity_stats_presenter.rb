class ProductivityStatsPresenter < StatsPresenter
  WEEK_PERIODS = Settings.productivity_week_periods_keys

  def chart(productivities)
    {
      labels: dates_peridiocity(productivities[:target].keys, chart_period),
      datasets: [
        { label: 'Productividad Real', values: productivities[:real].values },
        { label: 'Productividad Ideal', values: productivities[:target].values },
        { label: 'Productividad Optimizada', values: productivities[:optimized].values }
      ]
    }
  end
end
