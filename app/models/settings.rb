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
    month = month_by_date(year, date)
    {
      year: year,
      month: month,
      week: week_by_date(year, month, date)
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
      'monday_friday_am': ['10-11', '11-12','12-13'],
      'monday_friday_pm': ['13-14','14-15','15-16','16-17','17-18','18-19','19-20','20-21'],
      'saturday_sunday_am': ['10-11', '11-12','12-13'],
      'saturday_sunday_pm': ['13-14','14-15','15-16','16-17','17-18','18-19','19-20','20-21']
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

  def achievements_department_base
    [
      {1 => [
        {'monday' => {
          '11:00:00 - 12:00:00' => 250000, '12:00:00 - 13:00:00' => 325000, '13:00:00 - 14:00:00' => 500000, '14:00:00 - 15:00:00' => 425000, '15:00:00 - 16:00:00' => 400000,
          '16:00:00 - 17:00:00' => 575000, '17:00:00 - 18:00:00' => 850000, '18:00:00 - 19:00:00' => 1125000, '19:00:00 - 20:00:00' => 875000, '20:00:00 - 21:00:00' => 600000 }
        },
        {'tuesday' => {
          '11:00:00 - 12:00:00' => 250000, '12:00:00 - 13:00:00' => 325000, '13:00:00 - 14:00:00' => 500000, '14:00:00 - 15:00:00' => 425000, '15:00:00 - 16:00:00' => 400000,
          '16:00:00 - 17:00:00' => 575000, '17:00:00 - 18:00:00' => 850000, '18:00:00 - 19:00:00' => 1125000, '19:00:00 - 20:00:00' => 875000, '20:00:00 - 21:00:00' => 600000 }
        },
        {'wednesday' => {
          '11:00:00 - 12:00:00' => 250000, '12:00:00 - 13:00:00' => 325000, '13:00:00 - 14:00:00' => 500000, '14:00:00 - 15:00:00' => 425000, '15:00:00 - 16:00:00' => 400000,
          '16:00:00 - 17:00:00' => 575000, '17:00:00 - 18:00:00' => 850000, '18:00:00 - 19:00:00' => 1125000, '19:00:00 - 20:00:00' => 875000, '20:00:00 - 21:00:00' => 600000 }
        },
        {'thurday' => {
          '11:00:00 - 12:00:00' => 250000, '12:00:00 - 13:00:00' => 325000, '13:00:00 - 14:00:00' => 500000, '14:00:00 - 15:00:00' => 425000, '15:00:00 - 16:00:00' => 400000,
          '16:00:00 - 17:00:00' => 575000, '17:00:00 - 18:00:00' => 850000, '18:00:00 - 19:00:00' => 1125000, '19:00:00 - 20:00:00' => 875000, '20:00:00 - 21:00:00' => 600000 }
        },
        {'friday' => {
          '11:00:00 - 12:00:00' => 250000, '12:00:00 - 13:00:00' => 325000, '13:00:00 - 14:00:00' => 500000, '14:00:00 - 15:00:00' => 425000, '15:00:00 - 16:00:00' => 400000,
          '16:00:00 - 17:00:00' => 575000, '17:00:00 - 18:00:00' => 850000, '18:00:00 - 19:00:00' => 1125000, '19:00:00 - 20:00:00' => 875000, '20:00:00 - 21:00:00' => 600000 }
        },
        {'saturday' => {
          '11:00:00 - 12:00:00' => 500000, '12:00:00 - 13:00:00' => 700000, '13:00:00 - 14:00:00' => 1000000, '14:00:00 - 15:00:00' => 850000, '15:00:00 - 16:00:00' => 680000,
          '16:00:00 - 17:00:00' => 1250000, '17:00:00 - 18:00:00' => 1875000, '18:00:00 - 19:00:00' => 2125000, '19:00:00 - 20:00:00' => 2375000, '20:00:00 - 21:00:00' => 1375000 }
        },
        {'sunday' => {
          '11:00:00 - 12:00:00' => 400000, '12:00:00 - 13:00:00' => 600000, '13:00:00 - 14:00:00' => 750000, '14:00:00 - 15:00:00' => 800000, '15:00:00 - 16:00:00' => 700000,
          '16:00:00 - 17:00:00' => 1000000, '17:00:00 - 18:00:00' => 1750000, '18:00:00 - 19:00:00' => 2000000, '19:00:00 - 20:00:00' => 2425000, '20:00:00 - 21:00:00' => 1000000 }
        }]
      },
      {2 => [
        {'monday' => {
            '11:00:00 - 12:00:00' => 225000, '12:00:00 - 13:00:00' => 292500, '13:00:00 - 14:00:00' => 450000, '14:00:00 - 15:00:00' => 382500, '15:00:00 - 16:00:00' => 360000,
            '16:00:00 - 17:00:00' => 517500, '17:00:00 - 18:00:00' => 765000, '18:00:00 - 19:00:00' => 1012500, '19:00:00 - 20:00:00' => 787500, '20:00:00 - 21:00:00' => 540000 }
        },
        {'tuesday' => {
            '11:00:00 - 12:00:00' => 212500, '12:00:00 - 13:00:00' => 276250, '13:00:00 - 14:00:00' => 425000, '14:00:00 - 15:00:00' => 361250, '15:00:00 - 16:00:00' => 340000,
            '16:00:00 - 17:00:00' => 488750, '17:00:00 - 18:00:00' => 722500, '18:00:00 - 19:00:00' => 956250, '19:00:00 - 20:00:00' => 743750, '20:00:00 - 21:00:00' => 510000 }
        },
        {'wednesday' => {
            '11:00:00 - 12:00:00' => 240000, '12:00:00 - 13:00:00' => 312000, '13:00:00 - 14:00:00' => 480000, '14:00:00 - 15:00:00' => 408000, '15:00:00 - 16:00:00' => 384000,
            '16:00:00 - 17:00:00' => 552000, '17:00:00 - 18:00:00' => 816000, '18:00:00 - 19:00:00' => 1080000, '19:00:00 - 20:00:00' => 840000, '20:00:00 - 21:00:00' => 576000 }
        },
        {'thurday' => {
            '11:00:00 - 12:00:00' => 217500, '12:00:00 - 13:00:00' => 282750, '13:00:00 - 14:00:00' => 435000, '14:00:00 - 15:00:00' => 369750, '15:00:00 - 16:00:00' => 348000,
            '16:00:00 - 17:00:00' => 500250, '17:00:00 - 18:00:00' => 739500, '18:00:00 - 19:00:00' => 978750, '19:00:00 - 20:00:00' => 761250, '20:00:00 - 21:00:00' => 522000 }
        },
        {'friday' => {
            '11:00:00 - 12:00:00' => 225000, '12:00:00 - 13:00:00' => 292500, '13:00:00 - 14:00:00' => 450000, '14:00:00 - 15:00:00' => 382500, '15:00:00 - 16:00:00' => 360000,
            '16:00:00 - 17:00:00' => 517500, '17:00:00 - 18:00:00' => 765000, '18:00:00 - 19:00:00' => 1012500, '19:00:00 - 20:00:00' => 787500, '20:00:00 - 21:00:00' => 540000 }
        },
        {'saturday' => {
            '11:00:00 - 12:00:00' => 450000, '12:00:00 - 13:00:00' => 630000, '13:00:00 - 14:00:00' => 900000, '14:00:00 - 15:00:00' => 765000, '15:00:00 - 16:00:00' => 612000,
            '16:00:00 - 17:00:00' => 1125000, '17:00:00 - 18:00:00' => 1687500, '18:00:00 - 19:00:00' => 1912500, '19:00:00 - 20:00:00' => 2137500, '20:00:00 - 21:00:00' => 1237500 }
        },
        {'sunday' => {
            '11:00:00 - 12:00:00' => 360000, '12:00:00 - 13:00:00' => 540000, '13:00:00 - 14:00:00' => 675000, '14:00:00 - 15:00:00' => 720000, '15:00:00 - 16:00:00' => 630000,
            '16:00:00 - 17:00:00' => 900000, '17:00:00 - 18:00:00' => 1575000, '18:00:00 - 19:00:00' => 1800000, '19:00:00 - 20:00:00' => 2182500, '20:00:00 - 21:00:00' => 900000 }
        }]
      },
      {3 => [
        {'monday' => {
            '11:00:00 - 12:00:00' => 237500, '12:00:00 - 13:00:00' => 308750, '13:00:00 - 14:00:00' => 475000, '14:00:00 - 15:00:00' => 403750, '15:00:00 - 16:00:00' => 380000,
            '16:00:00 - 17:00:00' => 546250, '17:00:00 - 18:00:00' => 807500, '18:00:00 - 19:00:00' => 1068750, '19:00:00 - 20:00:00' => 831250, '20:00:00 - 21:00:00' => 570000 }
        },
        {'tuesday' => {
            '11:00:00 - 12:00:00' => 231250, '12:00:00 - 13:00:00' => 300625, '13:00:00 - 14:00:00' => 462500, '14:00:00 - 15:00:00' => 393125, '15:00:00 - 16:00:00' => 370000,
            '16:00:00 - 17:00:00' => 531875, '17:00:00 - 18:00:00' => 786250, '18:00:00 - 19:00:00' => 1040625, '19:00:00 - 20:00:00' => 809375, '20:00:00 - 21:00:00' => 555000 }
        },
        {'wednesday' => {
            '11:00:00 - 12:00:00' => 245000, '12:00:00 - 13:00:00' => 318500, '13:00:00 - 14:00:00' => 490000, '14:00:00 - 15:00:00' => 416500, '15:00:00 - 16:00:00' => 392000,
            '16:00:00 - 17:00:00' => 563500, '17:00:00 - 18:00:00' => 833000, '18:00:00 - 19:00:00' => 1102500, '19:00:00 - 20:00:00' => 857500, '20:00:00 - 21:00:00' => 588000 }
        },
        {'thurday' => {
            '11:00:00 - 12:00:00' => 233750, '12:00:00 - 13:00:00' => 303875, '13:00:00 - 14:00:00' => 467500, '14:00:00 - 15:00:00' => 397375, '15:00:00 - 16:00:00' => 374000,
            '16:00:00 - 17:00:00' => 537625, '17:00:00 - 18:00:00' => 794750, '18:00:00 - 19:00:00' => 1051875, '19:00:00 - 20:00:00' => 818125, '20:00:00 - 21:00:00' => 561000 }
        },
        {'friday' => {
            '11:00:00 - 12:00:00' => 237500, '12:00:00 - 13:00:00' => 308750, '13:00:00 - 14:00:00' => 475000, '14:00:00 - 15:00:00' => 403750, '15:00:00 - 16:00:00' => 380000,
            '16:00:00 - 17:00:00' => 546250, '17:00:00 - 18:00:00' => 807500, '18:00:00 - 19:00:00' => 1068750, '19:00:00 - 20:00:00' => 831250, '20:00:00 - 21:00:00' => 570000, }
        },
        {'saturday' => {
            '11:00:00 - 12:00:00' => 475000, '12:00:00 - 13:00:00' => 665000, '13:00:00 - 14:00:00' => 950000, '14:00:00 - 15:00:00' => 807500, '15:00:00 - 16:00:00' => 646000,
            '16:00:00 - 17:00:00' => 1187500, '17:00:00 - 18:00:00' => 1781250, '18:00:00 - 19:00:00' => 2018750, '19:00:00 - 20:00:00' => 2256250, '20:00:00 - 21:00:00' => 1306250, }
        },
        {'sunday' => {
            '11:00:00 - 12:00:00' => 380000, '12:00:00 - 13:00:00' => 570000, '13:00:00 - 14:00:00' => 712500, '14:00:00 - 15:00:00' => 760000, '15:00:00 - 16:00:00' => 665000,
            '16:00:00 - 17:00:00' => 950000, '17:00:00 - 18:00:00' => 1662500, '18:00:00 - 19:00:00' => 1900000, '19:00:00 - 20:00:00' => 2303750, '20:00:00 - 21:00:00' => 950000 }
        }]
      },
      {4 => [
        {'monday' => {
            '11:00:00 - 12:00:00' => 261250, '12:00:00 - 13:00:00' => 339625, '13:00:00 - 14:00:00' => 522500, '14:00:00 - 15:00:00' => 444125, '15:00:00 - 16:00:00' => 418000,
            '16:00:00 - 17:00:00' => 600875, '17:00:00 - 18:00:00' => 888250, '18:00:00 - 19:00:00' => 1175625, '19:00:00 - 20:00:00' => 914375, '20:00:00 - 21:00:00' => 627000 }
        },
        {'tuesday' => {
            '11:00:00 - 12:00:00' => 254375, '12:00:00 - 13:00:00' => 330688, '13:00:00 - 14:00:00' => 508750, '14:00:00 - 15:00:00' => 432438, '15:00:00 - 16:00:00' => 407000,
            '16:00:00 - 17:00:00' => 585063, '17:00:00 - 18:00:00' => 864875, '18:00:00 - 19:00:00' => 1144688, '19:00:00 - 20:00:00' => 890313, '20:00:00 - 21:00:00' => 610500 }
        },
        {'wednesday' => {
            '11:00:00 - 12:00:00' => 269500, '12:00:00 - 13:00:00' => 350350, '13:00:00 - 14:00:00' => 539000, '14:00:00 - 15:00:00' => 458150, '15:00:00 - 16:00:00' => 431200,
            '16:00:00 - 17:00:00' => 619850, '17:00:00 - 18:00:00' => 916300, '18:00:00 - 19:00:00' => 1212750, '19:00:00 - 20:00:00' => 943250, '20:00:00 - 21:00:00' => 646800 }
        },
        {'thurday' => {
            '11:00:00 - 12:00:00' => 257125, '12:00:00 - 13:00:00' => 334263, '13:00:00 - 14:00:00' => 514250, '14:00:00 - 15:00:00' => 437113, '15:00:00 - 16:00:00' => 411400,
            '16:00:00 - 17:00:00' => 591388, '17:00:00 - 18:00:00' => 874225, '18:00:00 - 19:00:00' => 1157063, '19:00:00 - 20:00:00' => 899938, '20:00:00 - 21:00:00' => 617100 }
        },
        {'friday' => {
            '11:00:00 - 12:00:00' => 261250, '12:00:00 - 13:00:00' => 339625, '13:00:00 - 14:00:00' => 522500, '14:00:00 - 15:00:00' => 444125, '15:00:00 - 16:00:00' => 418000,
            '16:00:00 - 17:00:00' => 600875, '17:00:00 - 18:00:00' => 888250, '18:00:00 - 19:00:00' => 1175625, '19:00:00 - 20:00:00' => 914375, '20:00:00 - 21:00:00' => 627000 }
        },
        {'saturday' => {
            '11:00:00 - 12:00:00' => 522500, '12:00:00 - 13:00:00' => 731500, '13:00:00 - 14:00:00' => 1045000, '14:00:00 - 15:00:00' => 888250, '15:00:00 - 16:00:00' => 710600,
            '16:00:00 - 17:00:00' => 1306250, '17:00:00 - 18:00:00' => 1959375, '18:00:00 - 19:00:00' => 2220625, '19:00:00 - 20:00:00' => 2481875, '20:00:00 - 21:00:00' => 1436875 }
        },
        {'sunday' => {
            '11:00:00 - 12:00:00' => 418000, '12:00:00 - 13:00:00' => 627000, '13:00:00 - 14:00:00' => 783750, '14:00:00 - 15:00:00' => 836000, '15:00:00 - 16:00:00' => 731500,
            '16:00:00 - 17:00:00' => 1045000, '17:00:00 - 18:00:00' => 1828750, '18:00:00 - 19:00:00' => 2090000, '19:00:00 - 20:00:00' => 2534125, '20:00:00 - 21:00:00' => 1045000 }
        }]
      }
    ]
  end
end
