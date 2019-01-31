Achievement.delete_all

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

User.sellers.each do |seller|
  date = Date.new(2017, 1, 2)
  department = seller.store_department.department.name
  sales_rate = Settings::DEMO_DEPARTMENTS[department]['sales_rate'] / 100

  (2017..2019).each do |year|
    (1..12).each do |month|
      department_sale = sales_rate * STORE_TOTAL_BY_MONTH[month]
      weeks = Settings.weeks_by_month[month]
      (1..weeks).each do
        proportions_by_hour= Settings.sales_proportions_week
        week_sale = department_sale / weeks
        week_sale += week_sale * rand(-0.07..0.03) if year != 2017
        (0..6).each do |day|
          sellers = seller.store_department.sellers.employees_by_hour(date)
          achievement = Settings.periods_keys.each_with_object({}) do |key, hash|
            hash[key] = (week_sale * (proportions_by_hour[day][key] / 100) / (sellers[key] || 1) ).round.to_i
          end

          Achievement.create!(user_id: seller.id, date: date,
                              store_department: seller.store_department,
                              store: seller.store,
                              achievement: achievement)
          date += 1
        end
      end
    end
  end
end

puts 'achievements loaded'



# date = Settings.month_start(year, month)
# achievements.each do |achievement|
#   achievement.values.flatten.each_with_index do |day_achievement, i|
#     sellers = store_department_base.sellers.working_on_date(date)
#     seller_count = sellers.size
#     custom = day_achievement.values.first
#     custom = custom.keys.zip(custom.values.map { |a| a / seller_count })
#     week = achievement.keys.first
#     day = i + 1
#     sellers.each do |seller|
#       Achievement.create!(user_id: seller.id, date: date,
#                           store_department_id: store_department_base.id,
#                           store: store_department_base.store,
#                           achievement: custom.to_h)
#     end
#     date += 1
#   end
# end

# STORE_DEPARTMENT_SALES = store_department_base.achievements.between(period[:start], period[:end]).sum(:total_day)
# STORE_TOTAL = (STORE_DEPARTMENT_SALES / (Settings::DEMO_DEPARTMENTS[department_base]['sales_rate'] / 100)).round

# def week_data(period, store_department_base, store_department_sales)
#   base_total = store_department_base.achievements.between(period[:start], period[:end]).sum(:total_day)
#   {
#     base_total: base_total,
#     total: store_department_sales * (base_total / STORE_DEPARTMENT_SALES.to_f)
#   }
# end

# def achievement_by_hour(week, store_department_base, store_department, date, sellers_count)
#   achievement_by_hour_base = store_department_base.achievements.by_date(date).sum_by_hour
#   achievement_by_hour_rate = achievement_by_hour_base.values.map { |a| a / week[:base_total].to_f }
#   achievement_by_hour = achievement_by_hour_rate.map { |a| (a * week[:total]).round }
#   Settings.periods_keys.zip(achievement_by_hour.map { |a| a / sellers_count }).to_h
# rescue
#   {}
# end

# # load month 7, year 2017 for all departments allowed except 'Moda Mujer'

# departments = Settings::DEPARTMENTS_ALLOWED
# departments.delete(department_base)

# departments.each do |department|
#   store_department_sales = STORE_TOTAL * (Settings::DEMO_DEPARTMENTS[department]['sales_rate'] / 100)
#   store_department = StoreDepartment.find_by(store: Store.find_by(name: 'Alto Las Condes'), department: Department.find_by(name: department))

#   date = period[:start]

#   (1..Settings.weeks_by_month[month]).each do |week|
#     period = Settings.week_period(year, month, week)
#     week_ = week_data(period, store_department_base, store_department_sales)
#     (1..7).each do |day|
#       sellers = store_department.sellers.working_on_date(date)
#       sellers_count = sellers.size
#       achievement_by_hour = achievement_by_hour(week_, store_department_base, store_department, date, sellers_count)
#       sellers.each do |seller|
#         Achievement.create!(user_id: seller.id, date: date,
#                             store_department_id: store_department.id,
#                             store: store_department.store,
#                             achievement: achievement_by_hour)
#       end
#       date += 1
#     end
#   end
# end

# # load months for all departments allowed except month 7, year 2017

# store_year_total = STORE_TOTAL / (Settings.sale_rates_by_month[month] / 100)
# departments << 'Mujer'

# (2017..2018).each do |year|

#   months_considered = [1,2,3,4,5,7,8,9,10,11,12] if year == 2017
#   months_considered = [1,2,3,4,5,6,7,8,9,10,11,12] if year == 2018

#   months_considered.each do |month|
#     month_total = store_year_total * (Settings.sale_rates_by_month[month] / 100)
#     period = Settings.month_period(year, month)

#     departments.each do |department|
#       store_department_sales = STORE_TOTAL * (Settings::DEMO_DEPARTMENTS[department]['sales_rate'] / 100)
#       store_department_sales *= rand(-0.3...7) if year == 2018
#       store_department = StoreDepartment.find_by(store: Store.find_by(name: 'Alto Las Condes'), department: Department.find_by(name: department))

#       date = period[:start]

#       weeks = Settings.weeks_by_month[month]
#       (1..weeks).each do |week|
#         week_sales = store_department_sales / months
#         week_sales *= rand(0.89...1.12)
#         (1..7).each do |day|
#           sellers = store_department.sellers.working_on_date(date)
#           sellers_count = sellers.size
#           achievement_by_hour = Settings.day_rate(week_sales, day, sellers_count)

#           sellers.each do |seller|
#             Achievement.create!(user_id: seller.id, date: date,
#               store_department_id: store_department.id,
#               store: store_department.store,
#               achievement: achievement_by_hour)
#           end
#           date += 1
#         end
#       end
#     end
#   end
# end

#
