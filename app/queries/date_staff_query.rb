class DateStaffQuery
  def initialize(employees)
    @employees = employees
  end

  def call
    @employees.joins(", generate_series(
      worked_shifts.check_in, worked_shifts.check_out - interval '1' hour,
      interval '1 hour') AS custom_interval").
      group('custom_interval').
      select("custom_interval,
        ARRAY_AGG(users.id) as ids,
        ARRAY_AGG(CONCAT(users.name, ' ',users.surname_1)) as names").
      order('custom_interval')
  end
end