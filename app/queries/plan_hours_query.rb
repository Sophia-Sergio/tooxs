class PlanHoursQuery
  def initialize(opts, employees = Employee.all)
    @opts = opts
    @employees = employees
  end

  def employees
    @employees.joins(:shifts).where(user_shifts:
      { year: @opts[:year], month: @opts[:month], week: @opts[:month], status: UserShift.statuses[:active] }).
      joins('INNER JOIN work_shifts ON user_shifts.work_shift_id = work_shifts.id').
      joins('INNER JOIN plan_shifts ON plan_shifts.work_shift_id = work_shifts.id
        AND user_shifts.week = plan_shifts.week').
      select("SUM(CASE
        WHEN plan_shifts.check_in < '2000-01-01 13:00' AND plan_shifts.day <= 5 THEN
          DATE_PART('hour', '2000-01-01 13:00:00'::time - plan_shifts.check_in::time)
        ELSE 0 END) AS monday_friday_am").
      select("SUM(CASE
        WHEN plan_shifts.check_in <= '2000-01-01 13:00' AND plan_shifts.day <= 5 THEN
          DATE_PART('hour', plan_shifts.check_out::time - '2000-01-01 13:00:00')
        WHEN plan_shifts.check_in >= '2000-01-01 13:00' AND plan_shifts.day <= 5 THEN
          DATE_PART('hour', plan_shifts.check_out::time - plan_shifts.check_in::time)
        ELSE 0 END) AS monday_friday_pm").
      select("SUM(CASE
        WHEN plan_shifts.check_in < '2000-01-01 13:00' AND plan_shifts.day >= 6 THEN
          DATE_PART('hour', '2000-01-01 13:00:00'::time - plan_shifts.check_in::time)
        ELSE 0 END) AS saturday_sunday_am").
      select("SUM(CASE
        WHEN plan_shifts.check_in <= '2000-01-01 13:00' AND plan_shifts.day >= 6 THEN
          DATE_PART('hour', plan_shifts.check_out::time - '2000-01-01 13:00:00')
        WHEN plan_shifts.check_in >= '2000-01-01 13:00' AND plan_shifts.day >= 6 THEN
          DATE_PART('hour', plan_shifts.check_out::time - plan_shifts.check_in::time)
        ELSE 0 END) AS saturday_sunday_pm").
      select('users.id').group('users.id')
  end

  def employee(employee)
    call(@opts).where('user_shifts.user_id = ?', employee)
  end
end


