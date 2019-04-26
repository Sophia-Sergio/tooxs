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

Employee.sellers.each do |seller|
  date = Date.new(2017, 1, 2)
  department = seller.store_department.department.name
  next if ['Benefit', 'Benetton'].include? department

  sales_rate = Settings::DEMO_DEPARTMENTS[department]['sales_rate'] / 100

  (2017..2019).each do |year|
    (1..12).each do |month|
      department_sale = sales_rate * STORE_TOTAL_BY_MONTH[month]
      weeks = Settings.weeks_by_month[month]
      next if date > Date.new(2019, 3, 1)

      (1..weeks).each do
        proportions_by_hour = Settings.sales_proportions_week
        week_sale = department_sale / weeks
        week_sale += week_sale * rand(-0.07..0.03) if year != 2017
        (0..6).each do |day|
          sellers = seller.store_department.sellers.count_employees_by_hour(date)
          achievement = Settings.productivity_periods_keys.each_with_object({}) do |key, hash|
            hash[key] = (week_sale * (proportions_by_hour[day][key] / 100) / (sellers[key][:count] || 1) ).round.to_i
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