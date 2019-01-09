Achievement.delete_all

department_base = 'Moda Mujer'
store_department_base = StoreDepartment.find_by(store: Store.find_by(name: 'Alto Las Condes'), department: Department.find_by(name: department_base))
month = 6
year = 2017
period = Settings.month_period(year, month)
# extracted from excel file made by Fernando Perez
achievements = Settings.achievements_department_base

date = Settings.month_start(year, month)
achievements.each do |achievement|
  achievement.values.flatten.each_with_index do |day_achievement, i|
    sellers = store_department_base.sellers.working_on_date(date)
    seller_count = sellers.size
    custom = day_achievement.values.first
    custom = custom.keys.zip(custom.values.map { |a| a / seller_count })
    week = achievement.keys.first
    day = i + 1
    sellers.each do |seller|
      Achievement.create!(user_id: seller.id, date: date,
                          store_department_id: store_department_base.id,
                          store: store_department_base.store,
                          achievement: custom.to_h,
                          year: year, month: month,
                          week: week, day: day)
    end
    date += 1
  end
end

STORE_DEPARTMENT_SALES = store_department_base.achievements.between(period[:start], period[:end]).sum(:total_day)
STORE_TOTAL = (STORE_DEPARTMENT_SALES / (Settings::DEMO_DEPARTMENTS[department_base]['sales_rate'] / 100)).round

def week_data(period, store_department_base, store_department_sales)
  base_total = store_department_base.achievements.between(period[:start], period[:end]).sum(:total_day)
  {
    base_total: base_total,
    total: store_department_sales * (base_total / STORE_DEPARTMENT_SALES.to_f)
  }
end

def achievement_by_hour(week, store_department_base, store_department, date, sellers_count)
  achievement_by_hour_base = store_department_base.achievements.by_date(date).sum_by_hour
  achievement_by_hour_rate = achievement_by_hour_base.values.map { |a| a / week[:base_total].to_f }
  achievement_by_hour = achievement_by_hour_rate.map { |a| (a * week[:total]).round }
  Settings.periods_keys.zip(achievement_by_hour.map { |a| a / sellers_count }).to_h
rescue
  {}
end

# load month 7, year 2017 for all departments allowed except 'Moda Mujer'

departments = Settings::DEPARTMENTS_ALLOWED
departments.delete(department_base)

departments.each do |department|
  store_department_sales = STORE_TOTAL * (Settings::DEMO_DEPARTMENTS[department]['sales_rate'] / 100)
  store_department = StoreDepartment.find_by(store: Store.find_by(name: 'Alto Las Condes'), department: Department.find_by(name: department))

  date = period[:start]

  (1..Settings.weeks_by_month[month]).each do |week|
    period = Settings.week_period(year, month, week)
    week_ = week_data(period, store_department_base, store_department_sales)
    (1..7).each do |day|
      sellers = store_department.sellers.working_on_date(date)
      sellers_count = sellers.size
      achievement_by_hour = achievement_by_hour(week_, store_department_base, store_department, date, sellers_count)
      sellers.each do |seller|
        Achievement.create!(user_id: seller.id, date: date,
                            store_department_id: store_department.id,
                            store: store_department.store,
                            achievement: achievement_by_hour,
                            year: year, month: month,
                            week: week, day: day)
      end
      date += 1
    end
  end
end

# load months for all departments allowed except month 7, year 2017

store_year_total = STORE_TOTAL / (Settings.sale_rates_by_month[month] / 100)
departments << 'Moda Mujer'

(2017..2018).each do |year|

  months_considered = [1,2,3,4,5,7,8,9,10,11,12] if year == 2017
  months_considered = [1,2,3,4,5,6,7,8,9,10,11,12] if year == 2018

  months_considered.each do |month|
    month_total = store_year_total * (Settings.sale_rates_by_month[month] / 100)
    period = Settings.month_period(year, month)

    departments.each do |department|
      store_department_sales = STORE_TOTAL * (Settings::DEMO_DEPARTMENTS[department]['sales_rate'] / 100)
      store_department_sales *= rand(-0.3...7) if year == 2018
      store_department = StoreDepartment.find_by(store: Store.find_by(name: 'Alto Las Condes'), department: Department.find_by(name: department))

      date = period[:start]

      months = Settings.weeks_by_month[month]
      (1..months).each do |week|
        week_sales = store_department_sales / months
        week_sales *= rand(0.89...1.12)
        (1..7).each do |day|
          sellers = store_department.sellers.working_on_date(date)
          sellers_count = sellers.size
          achievement_by_hour = Settings.day_rate(week_sales, day, sellers_count)

          sellers.each do |seller|
            Achievement.create!(user_id: seller.id, date: date,
              store_department_id: store_department.id,
              store: store_department.store,
              achievement: achievement_by_hour,
              year: year, month: month,
              week: week, day: day)
          end
          date += 1
        end
      end
    end
  end
end

puts 'achievements loaded'
