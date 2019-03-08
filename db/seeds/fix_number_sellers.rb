store_department = StoreDepartment.find_by(store: 13, department_id: 3)
store_department.employees.delete_all
store_department.achievements.delete_all
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

def create_employees(store_department, role)
  count = User.all.size
  name = Faker::Name.first_name.gsub(' ', '.')
  surname_1 = Faker::Name.last_name.gsub(' ', '.')
  email = "#{I18n.transliterate(name)}.#{I18n.transliterate(surname_1)}.#{count}@falabella.com"
  phone = "+56 9 #{rand(10000000..99999999)}"
  seller = Employee.create!(name: name, surname_1: surname_1, email: email,
                password: 123456, phone: phone, address: Faker::Address.full_address,
                commune: COMMUNES.sample, store_department: store_department, store: store_department.store)
  seller.save!
  seller.add_role role.to_sym
end

(Settings::DEMO_DEPARTMENTS[store_department.department.name]['employees']['sellers'] *4).times do
  create_employees(store_department, 'seller')
end
store_department = StoreDepartment.find_by(store: 13, department_id: 3)
users = store_department.employees
(2017..2019).each do |year|
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


# store_department.employees.sellers.each do |seller|
#   date = Date.new(2017, 1, 2)
#   department = seller.store_department.department.name
#   sales_rate = Settings::DEMO_DEPARTMENTS[department]['sales_rate'] / 100

#   (2017..2019).each do |year|
#     (1..12).each do |month|
#       department_sale = sales_rate * STORE_TOTAL_BY_MONTH[month]
#       weeks = Settings.weeks_by_month[month]
#       next if date > Date.new(2019, 3, 1)

#       (1..weeks).each do
#         proportions_by_hour = Settings.sales_proportions_week
#         week_sale = department_sale / weeks
#         week_sale += week_sale * rand(-0.07..0.03) if year != 2017
#         (0..6).each do |day|
#           sellers = seller.store_department.sellers.count_employees_by_hour(date)
#           achievement = Settings.productivity_periods_keys.each_with_object({}) do |key, hash|
#             hash[key] = (week_sale * (proportions_by_hour[day][key] / 100) / (sellers[key][:count] || 1) ).round.to_i
#           end

#           Achievement.create!(user_id: seller.id, date: date,
#                               store_department: seller.store_department,
#                               store: seller.store,
#                               achievement: achievement)
#           date += 1
#         end
#       end
#     end
#   end
# end

