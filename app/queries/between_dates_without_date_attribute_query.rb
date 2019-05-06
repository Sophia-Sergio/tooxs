class BetweenDatesWithoutDateAttributeQuery
  include CommercialCalendar::Period

  def initialize(model, period)
    @model = model
    @period = period
  end

  def call
    if year_by_date(@period[:start]) == year_by_date(@period[:end])
      @model.order(:year, :month, :week).where('year = ? AND month >= ? AND month <= ?',
        year_by_date(@period[:start]), month_by_date(@period[:start]), month_by_date(@period[:end]))
    else
      @model.order(:year, :month, :week).
        where('year = ? AND month >= ?', year_by_date(@period[:start]), month_by_date(@period[:start])).
        or('year = ? AND month <= ?', year_by_date(@period[:end]), month_by_date(@period[:end]))
    end
  end
end
