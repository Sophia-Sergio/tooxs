class DateCountStaffQuery
  def initialize(employees = Employee.all)
    @employees = employees
  end

  def call(date)
    @employees.working_on_date(date).joins(", generate_series(
      worked_shifts.check_in,
      worked_shifts.check_out - interval '1' hour,
      interval '1 hour') custom_interval").
      group('custom_interval').order('custom_interval').count
  end
end
