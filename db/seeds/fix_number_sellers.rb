include CommercialCalendar::Period
@@store_department = StoreDepartment.find_by(store: 13, department_id: 3)
@@store_department.employees.delete_all
@@store_department.achievements.delete_all
SALES_2017_BY_MONTH = {
  1 => 7.13,
  2 => 7.52,
  3 => 6.89,
  4 => 8.0,
  5 => 7.92,
  6 => 7.44,
  7 => 8.39,
  8 => 7.6,
  9 => 6.89,
  10 => 7.68,
  11 => 8.0,
  12 => 16.55
}

SALES_JUNE = Settings::DEMO_DEPARTMENTS['Accesorios Mujer']['sales_june_2017']
SALES_RATE_JUNE = Settings::DEMO_DEPARTMENTS['Accesorios Mujer']['sales_rate']
STORE_TOTAL_JUNE = SALES_JUNE / (SALES_RATE_JUNE / 100)
STORE_TOTAL_YEAR = STORE_TOTAL_JUNE / (SALES_2017_BY_MONTH[7] / 100)
STORE_TOTAL_BY_MONTH = SALES_2017_BY_MONTH.each_with_object({}) do |(k,v), hash|
  hash[k] = STORE_TOTAL_YEAR * ( v / 100)
end

WEEKS_BY_MONTH = Settings.weeks_by_month
COMMUNES = ["Providencia", "Maipu", "Cerro Navia", "Temuco", "Vitacura", "Puente Alto", "Macul", "San Pedro de la Paz", "La Reina", "La Florida"]

# create employees
def create_employees(role)
  count = User.all.size
  name = Faker::Name.first_name.gsub(' ', '.')
  surname = Faker::Name.last_name.gsub(' ', '.')
  email = "#{I18n.transliterate(name)}.#{I18n.transliterate(surname)}.#{count}@tienda.com"
  phone = "+56 9 #{rand(10000000..99999999)}"
  seller = Employee.create!(
    name: name, surname_1: surname, email: email,
    password: 123456, phone: phone, address: Faker::Address.full_address,
    commune: COMMUNES.sample, store_department: @@store_department, store: @@store_department.store
  )
  seller.save!
  seller.add_role role.to_sym
end

def create_work_shifts(user)
  (2019..2019).each do |year|
    date = Date.new(2019, 2, 25)
    (3..12).each do |month|
      work_shift = WorkShift.all.sample
      WEEKS_BY_MONTH[month].times do |i|
        week = i + 1
        UserShift.create!(store: user.store, user: user, work_shift: work_shift,
                          year: year, month: month, week: week)
        (1..7).each do |day|
          opts = { month: month, day: day, year: year, week: week }
          unless user.plan_check_in(opts).nil?
            WorkedShift.create!(
              user: user, date: date, check_in: user.plan_check_in(opts),
              check_out: user.plan_check_out(opts)
            )
          end
          date += 1
        end
      end
    end
  end
end

def create_break_times(employee)
  period = { start: Date.new(2019, 1, 2), end: Date.new(2019, 12, 29) }
  worked_shifts_dates = employee.worked_shifts_dates(period)
  (period[:start]..period[:end]).each do |date|
    next if worked_shifts_dates[date].nil?

    worked_check_in = worked_shifts_dates[date][0..2].to_i
    if rand(0..1) == 1
      ShiftBreak.create!(
        employee: employee, date: date, check_in: "#{worked_check_in + 2}:00:00",
        check_out: "#{worked_check_in + 2}:15:00", reason: 2
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

def create_achievements(seller)
  date = Date.new(2019, 2, 25)
  (2019..2019).each do |year|
    (3..12).each do |month|
      weeks = Settings.weeks_by_month[month]
      month_period = month_period(year, month)
      target_achievements = seller.target_achievements(month_period)
      (1..weeks).each do
        proportions_by_hour = Settings.sales_proportions_week
        (0..6).each do |day|
          if target_achievements[date].zero?
            date += 1
            next
          end

          proportions_day = proportions_by_hour[day].slice(*seller.hours_period_should_work(date))
          achievement = Settings.productivity_periods_keys.each_with_object({}) do |key, hash|
            hash[key] = 0
            next if proportions_day[key].nil?

            proportion = (proportions_day[key] / proportions_day.values.sum)
            sale = (target_achievements[date] * proportion).round.to_i
            hash[key] = (sale * rand(0.7..1.1)).to_i
          end
          Achievement.create!(
            user_id: seller.id, date: date, store_department: seller.store_department,
            store: seller.store, achievement: achievement
          )
          date += 1
        end
      end
    end
  end
end

year = 2019
(3..10).each do |month|
  period = month_period(year, month)
  plan_sales_department = @@store_department.categories_plan_sales(period).values.first
  sales = 0
  while sales < (plan_sales_department * 0.9)
    create_employees('seller')
    create_work_shifts(Employee.last)
    create_break_times(Employee.last)
    create_achievements(Employee.last)
    sales = StoreDepartment.find_by(store: 13, department_id: 3).achievements.between(period).map do |a|
      a.total_day
    end.sum
  end
end

categories = Category.where(cod: StoreDepartment.where(store_id: 13).joins(:categories).pluck(:category_cod).uniq)
categories.each do |category|
  date = Date.new(2019, 2, 25)
  department = category.store_departments.find_by(store:store).department.name
  next if department == "Benefit" || department == "Benetton"

  sales_rate = Settings::DEMO_DEPARTMENTS[department]['sales_rate'] / 100
  categories_count = Settings::DEMO_DEPARTMENTS[department]['categories'].count
  (2019..2019).each do |year|
    (4..12).each do |month|
      department_sale = sales_rate * STORE_TOTAL_BY_MONTH[month]
      weeks = Settings.weeks_by_month[month]
      sale_day = department_sale / categories_count / (weeks * 7)
      sale_day += sale_day * rand(-0.07..0.03) if year != 2017
      (1..weeks).each do
        (1..7).each do
          hourly = Settings.productivity_periods_keys.each_with_object({}) do |key, hash|
            hash[key] = (sale_day / Settings.productivity_periods_keys.count).round.to_i
          end
          CategorySale.create!(date:date, store: store, category: category, amount: sale_day, hourly: hourly)
          date += 1
        end
      end
    end
  end
end


# categories = StoreDepartment.find_by(store: 13, department_id: 3).categories.pluck(:cod)
# CategorySale.where(category_cod: categories).where('date > ?', '2019-03-24').each do |category_sale|
#   hourly = category_sale.hourly.each_with_object({}) do |(k,v), hash|
#     hash[k] = v.to_i * 3.8
#   end
#   amount = hourly.values.sum
#   category_sale.update(amount: amount, hourly: hourly)
# end