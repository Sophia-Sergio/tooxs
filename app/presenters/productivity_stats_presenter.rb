class ProductivityStatsPresenter < StatsPresenter
  WEEK_PERIODS = Settings.productivity_week_periods_keys

  def chart(productivities)
    {
      labels: dates_peridiocity(productivities[:target].keys, chart_period),
      datasets: [
        { label: 'Productividad Sin Optimizar', data: productivities[:no_optimized].values },
        { label: 'Productividad Ideal', data: productivities[:target].values },
        { label: 'Productividad Optimizada', data: productivities[:optimized].values }
      ]
    }
  end
end
