ShiftBreak.delete_all

Employee.all.each do |employee|
  period = { start: Date.new(2017, 1, 2), end: Date.new(2019, 12, 31) }
  worked_shifts_dates = employee.worked_shifts_dates(period)
  (period[:start]..period[:end]).each do |date|
    next if worked_shifts_dates[date].nil?

    worked_check_in = worked_shifts_dates[date][0..2].to_i
    if rand(0..1) == 1
      ShiftBreak.create!(
        employee: employee,
        date: date,
        check_in: "#{worked_check_in + 2}:00:00",
        check_out: "#{worked_check_in + 2}:15:00",
        reason: 2
      )
    end

    next if worked_check_in >= 14

    check_in = worked_check_in + 3 if worked_check_in < 12
    check_in = worked_check_in + 2 if (12..13).cover? worked_check_in

    ShiftBreak.create!(
      employee: employee,
      date: date,
      check_in: "#{check_in}:00:00",
      check_out: "#{check_in + 1}:00:00",
      reason: 1
    )
  end
end
