class StatsPresenter < SimpleDelegator
  include ApplicationHelper
  include ActionView::Helpers::NumberHelper
  include CommercialCalendar::Period
  include Defaults

  def initialize(model, period)
    @model = model
    @period = period
  end

  private

  def chart_period
    return 'daily' if months_difference == 1
    return 'weekly' if months_difference >= 2 && months_difference <= 7

    'monthly'
  end

  def dates_peridiocity(dates, periodicity)
    case periodicity
    when 'daily'
      dates
    when 'weekly'
      dates.each_with_index.map { |x, i| x if ((i + 1) % 7).zero? }.compact
    when 'monthly'
      dates.map { |date| year_month_by_date(date) }.uniq
    end
  end

  def months_difference
    year_start  = year_by_date(@period[:start])
    month_start = month_by_date(@period[:start])
    year_end    = year_by_date(@period[:end])
    month_end   = month_by_date(@period[:end])
    month_count = year_start == year_end ? month_end - month_start : 12 - month_start + month_end
    year_start == year_end ? month_count + 1 : (year_end - year_start - 1) * 12 + month_count + 1
  end

  def summary_table_values(data)
    periodicity = months_difference == 1 ? 'weekly' : 'monthly'
    values_peridiocity(data, periodicity)
  end

  def summary_table_avg_values(data)
    periodicity = months_difference == 1 ? 'weekly' : 'monthly'
    values_avg_peridiocity(data, periodicity)
  end

  def summary_table_titles(sales)
    if months_difference == 1
      dates_peridiocity(sales, 'weekly').each_with_object({}).with_index do |(date, hash), i|
        hash["Semana #{i + 1}"] = "#{day_month_format(date - 6)} - #{day_month_format(date)}"
      end
    else
      dates_peridiocity(sales, 'monthly').each_with_object({}) do |date, hash|
        month      = date.split('-')[1].to_i
        year       = date.split('-')[0].to_i
        period     = month_period(year, month)
        hash["#{year}-#{month}"] = "#{day_month_format(period[:start])} - #{day_month_format(period[:end])}"
      end
    end
  end

  def summary_table_titles_json(sales)
    titles = summary_table_titles(sales)
    if chart_period == 'daily'
      { title: titles.keys.map { |date| { label: date, tootlip: titles[date] } } }
    else
      { title: titles.keys.map { |date| { label: month_name(date.split('-')[1].to_i), tootlip: titles[date] } } }
    end
  end

  def values_peridiocity(data, periodicity)
    case periodicity
    when 'daily'
      data.values.map(&:to_i)
    when 'weekly'
      times = ((data.values.length / 7.0) - 1).ceil
      values = data.values
      (0..times).each_with_object([]) { |_, a| a << values.shift(7).sum }.map(&:to_i)
    when 'monthly'
      date_start = data.keys.first
      date_end   = data.keys.last
      (date_start..date_end).each_with_object({}) do |date, hash|
        (hash[year_month_by_date(date)] ||= []) << data[date]
      end.values.map(&:sum)
    end
  end

  def values_avg_peridiocity(data, periodicity)
    case periodicity
    when 'weekly'
      times = ((data.values.length / 7.0) - 1).ceil
      values = data.values
      (0..times).each_with_object([]) { |_, a| a << (values.shift(7).sum.to_f / 7) }.map(&:to_i)
    when 'monthly'
      date_start = data.keys.first
      date_end   = data.keys.last
      (date_start..date_end).each_with_object({}) do |date, hash|
        (hash[year_month_by_date(date)] ||= []) << data[date]
      end.values.each_with_object({}) do |(k,v), hash|
        hash[k] = v.values.sum / v.values.count.to_f
      end
    end
  end
end
