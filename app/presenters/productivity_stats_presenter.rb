class ProductivityStatsPresenter < StatsPresenter
  WEEK_PERIODS = Settings.productivity_week_periods_keys

  def chart(productivities)
    {
      chart_title_labels: dates_peridiocity(productivities[:real].keys, chart_period),
      charts: WEEK_PERIODS.keys.each_with_object([]) do |period, array|
        array << chart_data(productivities, period)
      end
    }
  end

  def chart_data(data, period)
    data.keys.each_with_object({}) do |key, hash|
      (hash[period] ||= []) << {
        label: key,
        data: values_peridiocity(data[key][period], chart_period)
      }
    end
  end
end
