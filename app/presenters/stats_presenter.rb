class StatsPresenter < SimpleDelegator
  include ApplicationHelper
  include ActionView::Helpers::NumberHelper
  include CommercialCalendar::Period
  include Defaults

  def initialize(model, period)
    @model = model
    @period = period
  end

  def chart_period
    return 'daily' if months_difference == 1
    return 'weekly' if months_difference >= 2 && months_difference <= 7

    'monthly'
  end

  def months_difference
    year_start  = year_by_date(@period[:start])
    month_start = month_by_date(@period[:start])
    year_end    = year_by_date(@period[:end])
    month_end   = month_by_date(@period[:end])
    month_count = year_start == year_end ? month_end - month_start : 12 - month_start + month_end
    year_start == year_end ? month_count + 1 : (year_end - year_start - 1) * 12 + month_count + 1
  end

  def efficiency
    {
      name: 'CUMPLIMIENTO DE EFICIENCIA',
      value: "#{@model.efficiency(@period).round(2)}%",
      description: 'Eficiencia Objetivo 75%'
    }
  end

  def efficiency_chart
    {
      goal_success: goal_success,
      productivity: productivity,
      efficiency: efficiency
    }
  end

  def sales_chart(sales_data)
    {
      labels: dates_peridiocity(sales_data[:sales].keys, chart_period),
      datasets: [
        { label: 'Real', data: values_peridiocity(sales_data[:sales], chart_period) },
        { label: 'Histórico', data: values_peridiocity(sales_data[:last_year_sales], chart_period) },
        { label: 'Plan', data: values_peridiocity(sales_data[:categories_plan_sales_by_dates], chart_period) }
      ]
    }
  end

  def sales_summary(sales_data)
    {
      title: {
        labels: summary_table_titles(sales_data).keys,
        tooltips: summary_table_titles(sales_data).values,
      },
      datasets: [
        { label: 'Real', data: summary_table_values(sales_data[:sales]) },
        { label: 'Real', data: summary_table_values(sales_data[:last_year_sales]) },
        { label: 'Real', data: summary_table_values(sales_data[:categories_plan_sales_by_dates]) }
      ]
    }
  end

  def summary_table_values(sales_data)
    if months_difference == 1
      values_peridiocity(sales_data, 'weekly')
    else
      values_peridiocity(sales_data, 'monthly')
    end
  end

  def summary_table_titles(sales_data)
    if months_difference == 1
      dates_peridiocity(sales_data[:sales].keys, 'weekly').
        each_with_object({}).with_index do |(date, hash), i|
          hash["Semana #{i + 1}"] = "#{day_month_format(date)} - #{day_month_format(date + 6)}"
        end
    else
      dates_peridiocity(sales_data[:sales].keys, 'monthly').each_with_object({}) do |date, hash|
        month = date.split('-')[1].to_i
        year = date.split('-')[0].to_i
        month_name = month_name(month)
        period = month_period(year, month)
        hash[month_name] = "#{day_month_format(period[:start])} - #{day_month_format(period[:end])}"
      end
    end
  end

  def goal_success
    plan_sales = @model.categories_plan_sales(@period).values.sum.round
    sales = @model.categories_sales(@period)
    {
      name: 'CUMPLIMIENTO PLAN DE VENTA',
      value: "#{((sales / plan_sales.to_f) * 100).round(2)}%",
      description: "Plan $#{number_with_delimiter(plan_sales)}. Real $#{number_with_delimiter(sales.round)}"
    }
  end

  def productivity
    avg_target_productivity = @model.year_month_target_productivity(
      year_by_date(@period[:start]), month_by_date(@period[:start]))
    {
      name: 'CUMPLIMIENTO REAL',
      value: "$#{number_with_delimiter(@model.productivity(@period).round)}",
      description: "Productividad Objetivo $#{number_with_delimiter(avg_target_productivity)}"
    }
  end

  private

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

  def values_peridiocity(data, periodicity)
    case periodicity
    when 'daily'
      data.values
    when 'weekly'
      times = data.values.length / 7
      (1..times).each_with_object([]) { |_, array| array << data.values.shift(7).sum }
    when 'monthly'
      date_start = data.keys.first
      date_end = data.keys.last
      (date_start..date_end).each_with_object({}) do |date, hash|
        (hash[year_month_by_date(date)] ||= []) << data[date]
      end.values.map(&:sum)
    end
  end
end
