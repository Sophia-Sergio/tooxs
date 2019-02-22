module Defaults
  extend ActiveSupport::Concern
  extend CommercialCalendar::Period

  def default_period
    month_period(default_year, default_month)
  end

  def default_year_month
    { year: default_year, month: default_month }
  end

  def default_year_month_week
    { year: default_year, month: default_month, week: default_week }
  end

  def default_month
    month_by_date(Date.today)
  end

  def default_year
    year_by_date(Date.today)
  end

  def default_week
    week_by_date(Date.today)
  end
end
