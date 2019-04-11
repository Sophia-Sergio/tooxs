PlannedShift.delete_all

Employee.all.each do |employee|
  ('2018-01-02'.to_date..'2019-12-29'.to_date).each do |date|
    worked_shift = employee.worked_shifts.find_by(date: date)
    work_shift = employee.work_shifts.first
    if worked_shift.present?
      PlannedShift.create!(
        user_id: employee.id,
        check_in: worked_shift.check_in,
        check_out: worked_shift.check_out,
        work_shift: work_shift,
        date: date
      )
    end
  end
end
