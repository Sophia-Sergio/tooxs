# 2017
users = User.with_role(:seller)
(2017..2018).each do |year|
  users.each do |user|
    if user.has_role?(:seller)
      user = Seller.new(user.attributes)
    elsif user.has_role?(:cashier)
      user = Cashier.new(user.attributes)
    end

    date = Date.new(year, 1, 2) if year == 2017
    date = Date.new(year, 1, 1) if year == 2018

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
                                check_out: user.plan_check_out(opts),
                                month: month, day: day, week: week)
          end
          date += 1
        end
      end
    end
  end
  puts "user_shifts_and_worked_shifts #{year} added"
end

