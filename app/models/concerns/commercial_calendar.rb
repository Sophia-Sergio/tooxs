class CommercialCalendar
  YEARS = [2017, 2018, 2019].freeze
  WEEKS_BY_MONTH = Settings.weeks_by_month
  PRODUCTIVITY_PERIODS = Settings.productivity_week_periods_keys
  DEFAULT_DATE = '2019-03-24'.to_date.freeze

  extend ActiveSupport::Concern
  module Period
    def old_period(period)
      {
        start: month_period(year_by_date(period[:start]) - 1, month_by_date(period[:start]))[:start],
        end: month_period(year_by_date(period[:end]) - 1, month_by_date(period[:end]))[:end]
      }
    end

    def day_number(date)
      date.wday.zero? ? 7 : date.wday
    end

    def equivalent_date_next_year(date)
      config_date = config_date(date)
      period = month_period(config_date[:year] + 1, config_date[:month])
      day = config_date[:week] == 1 ? config_date[:day] : (config_date[:week] - 1) * 7 + config_date[:day]
      (period[:start]..period[:end]).to_a[day - 1]
    end

    def equivalent_date_past_year(date)
      config_date = config_date(date)
      period = month_period(config_date[:year] - 1, config_date[:month])
      day = config_date[:week] == 1 ? config_date[:day] : (config_date[:week] - 1) * 7 + config_date[:day]
      (period[:start]..period[:end]).to_a[day - 1]
    end

    def month_end(year, month)
      month_start(year.to_i, month.to_i) + (WEEKS_BY_MONTH[month.to_i] * 7 - 1)
    end

    def year_period(year)
      { start: month_period(year, 1)[:start], end: month_period(year, 12)[:end] }
    end

    def month_period(year, month)
      { start: month_start(year, month), end: month_end(year, month) }
    end

    def week_period(year, month, week)
      { start: week_start(year, month, week), end: week_end(year, month, week) }
    end

    def month_start(year, month)
      date = Settings.start_dates["#{year}-#{month}"].split('-').map(&:to_i)
      Date.new(date[0], date[1], date[2])
    end

    def week_by_date(date)
      month = month_by_date(date)
      year = year_by_date(date)
      WEEKS_BY_MONTH[month].times do |week|
        period = week_period(year, month, week)
        return week if (period[:start]..period[:end]).cover? date.to_date
      end
    end

    def date_included_on_productivity_period?(period, date)
      day = date.wday.zero? ? 7 : date.wday
      periods = PRODUCTIVITY_PERIODS.keys.select { |p| p.include? period[0..-4] }
      week_days = period[0..-4] == 'monday_friday' ? (1..5).to_a : (6..7).to_a
      periods.include?(period) && week_days.include?(day)
    end

    def config_date(date)
      year = year_by_date(date)
      month = month_by_date(date)
      {
        year: year,
        month: month,
        week: week_by_date(date),
        day: day_number(date)
      }
    end

    def date_by_params(opts)
      week = opts[:week] == 1 ? 0 : opts[:week] - 1
      month_period(opts[:year], opts[:month])[:start] + (week * 7) + opts[:day] - 1
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

    def week_end(year, month, week)
      week_start(year, month, week) + 6
    end

    def week_start(year, month, week)
      month_start(year, month) + (week - 1) * 7
    end

    def month_before_or_equal_to_actual_month?(year, month)
      if year.to_i == year_by_date(DEFAULT_DATE)
        month.to_i <= month_by_date(DEFAULT_DATE)
      elsif year.to_i < year_by_date(DEFAULT_DATE)
        true
      end
    end
  end
end
