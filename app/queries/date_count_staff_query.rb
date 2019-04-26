class DateCountStaffQuery
  def initialize(employees = Employee.all)
    @employees = employees
  end

  def call(date, table)
    employees = if table == 'worked_shifts'
                  @employees.working_on_date(date)
                elsif table == 'planned_shifts'
                  @employees.planned_working_on_date(date)
                end
    employees.joins(", generate_series(
      #{table}.check_in,
      #{table}.check_out - interval '1' hour,
      interval '1 hour') custom_interval").
      group('custom_interval').order('custom_interval').count
  end
end
