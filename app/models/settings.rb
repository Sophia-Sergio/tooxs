class Settings < Settingslogic
  source "#{Rails.root}/config/application.yml"
  namespace Rails.env

  STORE_ALLOWED = 'Alto Las Condes'
  STORES_ALLOWED = ['Alto Las Condes'].freeze
  DEPARTMENTS_ALLOWED = [
    'Accesorios Mujer',
    'Electrodomésticos',
    'Audio y Video',
    'Alfombras y Maletas',
    'Gourmet',
    'Blanco',
    'Juguetería']
  DEMO_DEPARTMENTS = YAML.load_file("#{Rails.root}/config/demo_departments.yml")
  YEARS = [2017, 2018, 2019]

  def old_period(period)
    {
      start: month_period(year_by_date(period[:start]) - 1, month_by_date(period[:start]))[:start],
      end: month_period(year_by_date(period[:end]) - 1, month_by_date(period[:end]))[:end]
    }
  end

  def equivalent_date_next_year(date)
    config_date = config_date(date)
    period = month_period(config_date[:year] + 1, config_date[:month])
    day = config_date[:week] == 1 ? config_date[:day] : (config_date[:week] - 1) * 7 + config_date[:day]
    (period[:start]..period[:end]).to_a[day - 1]
  end

  def month_end(year, month)
    month_start(year.to_i, month.to_i) + (weeks_by_month[month.to_i] * 7 - 1)
  end

  def year_period(year)
    {
      start: month_period(year, 1)[:start],
      end: month_period(year, 12)[:end],
    }
  end

  def month_period(year, month)
    {
      start: month_start(year, month),
      end: month_end(year, month)
    }
  end

  def month_start(year, month)
    date = start_dates["#{year}-#{month}"].split('-').map(&:to_i)
    Date.new(date[0], date[1], date[2])
  end

  def week_by_date(year, month, date)
    weeks_by_month[month].times do |week|
      period = week_period(year, month, week)
      return week if (period[:start]..period[:end]).cover? date.to_date
    end
  end

  def config_date(date)
    year = year_by_date(date)
    month = month_by_date(date)
    {
      year: year,
      month: month,
      week: week_by_date(year, month, date),
      day: date.wday == 0 ? 7 : date.wday
    }
  end

  def year_by_date(date)
    YEARS.each do |year|
      return year if (year_period(year)[:start]..year_period(year)[:end]).cover? date.to_date
    end
  end

  def month_by_date(date)
    (1..12).each do |month|
      period = month_period(date.year, month)
      return month if (period[:start]..period[:end]).cover? date
    end
    1
  end

  def year_month_by_date(date)
    month = month_by_date(date)
    month = month > 9 ? month : '0' + month.to_s
    "#{year_by_date(date)}-#{month}"
  end

  def periods_keys
    [
      '10 - 11',
      '11 - 12',
      '12 - 13',
      '13 - 14',
      '14 - 15',
      '15 - 16',
      '16 - 17',
      '17 - 18',
      '18 - 19',
      '19 - 20',
      '20 - 21'
    ]
  end

  def week_periods_keys
    {
      'monday_friday_am': ['10 - 11', '11 - 12','12 - 13'],
      'monday_friday_pm': ['13 - 14','14 - 15','15 - 16','16 - 17','17 - 18','18 - 19','19 - 20','20 - 21'],
      'saturday_sunday_am': ['10 - 11', '11 - 12','12 - 13'],
      'saturday_sunday_pm': ['13 - 14','14 - 15','15 - 16','16 - 17','17 - 18','18 - 19','19 - 20','20 - 21']
    }.with_indifferent_access
  end

  def weeks_by_month
    {
      1 => 4,
      2 => 4,
      3 => 4,
      4 => 5,
      5 => 4,
      6 => 4,
      7 => 5,
      8 => 4,
      9 => 4,
      10 => 5,
      11 => 4,
      12 => 5
    }
  end

  def month_name
    {
      1 => 'Enero',
      2 => 'Febrero',
      3 => 'Marzo',
      4 => 'Abril',
      5 => 'Mayo',
      6 => 'Junio',
      7 => 'Julio',
      8 => 'Agosto',
      9 => 'Septiembre',
      10 => 'Ocutbre',
      11 => 'Noviembre',
      12 => 'Diciembre'
    }
  end

  def days_by_month(year)
    february = year % 4 == 0 ? 29 : 28
    {
      1 => 31,
      2 => february,
      3 => 31,
      4 => 30,
      5 => 31,
      6 => 30,
      7 => 31,
      8 => 31,
      9 => 30,
      10 => 31,
      11 => 30,
      12 => 31
    }
  end

  def sale_rates_by_month
    {
      1 => 7.1,
      2 => 7.5,
      3 => 6.9,
      4 => 8.0,
      5 => 7.9,
      6 => 7.4,
      7 => 8.4,
      8 => 7.6,
      9 => 6.9,
      10 => 7.7,
      11 => 8.0,
      12 => 16.5
    }
  end

  def week_end(year, month, week)
    week_start(year, month, week) + 6
  end

  def week_period(year, month, week)
    {
      start: week_start(year, month, week),
      end: week_end(year, month, week)
    }
  end

  def week_start(year, month, week)
    month_start(year, month) + (week - 1) * 7
  end

  def period_labels(period)
    (period[:start]..period[:end]).map { |date| "#{date.day}-#{date.strftime('%m')}" }
  end

  ## demo data
  def day_rate(week_sales, day, sellers)
    random_rates = (1..10).map do |hour|
      random_rate = rand(0.42..0.48) if (1..5).cover? day
      random_rate = rand(0.93..1.74) if (6..7).cover? day
      random_rate *= rand(1.1..1.3) if (6..9).cover?(hour) && (1..5).cover?(day)
      random_rate *= rand(2.1..2.3) if (6..9).cover?(hour) && (6..7).cover?(day)
      random_rate *= rand(1.15..1.38) if hour == 10
      random_rate.round(2)
    end
    sellers = 1 if sellers.zero?
    periods_keys.zip(random_rates.map { |rate| ((week_sales * (rate / 100)) / sellers ).round }).to_h
  end

  def sales_proportions_week
    [
      {
        '10 - 11' => 0.24,
        '11 - 12' => 0.24,
        '12 - 13' => 0.62,
        '13 - 14' => 0.96,
        '14 - 15' => 0.81,
        '15 - 16' => 0.76,
        '16 - 17' => 1.10,
        '17 - 18' => 1.43,
        '18 - 19' => 2.15,
        '19 - 20' => 1.67,
        '20 - 21' => 1.15
      },
      {
        '10 - 11' => 0.24,
        '11 - 12' => 0.24,
        '12 - 13' => 0.62,
        '13 - 14' => 0.96,
        '14 - 15' => 0.81,
        '15 - 16' => 0.76,
        '16 - 17' => 1.10,
        '17 - 18' => 1.43,
        '18 - 19' => 2.15,
        '19 - 20' => 1.67,
        '20 - 21' => 1.15
      },
      {
        '10 - 11' => 0.24,
        '11 - 12' => 0.24,
        '12 - 13' => 0.62,
        '13 - 14' => 0.96,
        '14 - 15' => 0.81,
        '15 - 16' => 0.76,
        '16 - 17' => 1.10,
        '17 - 18' => 1.43,
        '18 - 19' => 2.15,
        '19 - 20' => 1.67,
        '20 - 21' => 1.15
      },
      {
        '10 - 11' => 0.24,
        '11 - 12' => 0.24,
        '12 - 13' => 0.62,
        '13 - 14' => 0.96,
        '14 - 15' => 0.81,
        '15 - 16' => 0.76,
        '16 - 17' => 1.10,
        '17 - 18' => 1.43,
        '18 - 19' => 2.15,
        '19 - 20' => 1.67,
        '20 - 21' => 1.15
      },
      {
        '10 - 11' => 0.24,
        '11 - 12' => 0.24,
        '12 - 13' => 0.62,
        '13 - 14' => 0.96,
        '14 - 15' => 0.81,
        '15 - 16' => 0.76,
        '16 - 17' => 1.10,
        '17 - 18' => 1.43,
        '18 - 19' => 2.15,
        '19 - 20' => 1.67,
        '20 - 21' => 1.15
      },
      {
        '10 - 11' => 0.38,
        '11 - 12' => 0.38,
        '12 - 13' => 1.34,
        '13 - 14' => 1.71,
        '14 - 15' => 1.63,
        '15 - 16' => 1.3,
        '16 - 17' => 2.39,
        '17 - 18' => 3.28,
        '18 - 19' => 4.06,
        '19 - 20' => 4.53,
        '20 - 21' => 2.63
      },
      {
        '10 - 11' => 0.29,
        '11 - 12' => 0.38,
        '12 - 13' => 1.15,
        '13 - 14' => 1.43,
        '14 - 15' => 1.53,
        '15 - 16' => 1.34,
        '16 - 17' => 1.61,
        '17 - 18' => 3.15,
        '18 - 19' => 3.82,
        '19 - 20' => 4.14,
        '20 - 21' => 1.91
      },
    ]
  end
end
