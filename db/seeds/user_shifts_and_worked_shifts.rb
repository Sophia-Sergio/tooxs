UserShift.delete_all
WorkedShift.delete_all

users = User.employees
(2018..2019).each do |year|
  users.each do |user|
    date = Date.new(year, 1, 2) if year == 2017
    date = Date.new(year, 1, 1) if year == 2018
    date = Date.new(2018, 12, 31) if year == 2019

    break if date > Date.new(2019, 3, 1)

    (1..12).each do |month|
      work_shift = WorkShift.all.sample
      WEEKS_BY_MONTH[month].times do |i|
        week = i + 1
        UserShift.create!(store: user.store, user: user, work_shift: work_shift,
                          year: year, month: month, week: week)
        (1..7).each do |day|
          opts = { month: month, day: day, year: year, week: week }
          unless user.plan_check_in(opts).nil?
            WorkedShift.create!(user: user, date: date,
                                check_in: user.plan_check_in(opts),
                                check_out: user.plan_check_out(opts))
          end
          date += 1
        end
      end
    end
  end
  puts "user_shifts_and_worked_shifts #{year} added"
end



(1..15).each_with_index do |number, index|
  puts "hola #{index}"
  break if index > 12

end