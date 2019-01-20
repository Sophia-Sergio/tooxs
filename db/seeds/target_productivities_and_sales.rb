# periods
# 1 => 'AM_monday_friday'
# 2 => 'PM_monday_friday'
# 3 => 'AM_saturday_sunday'
# 4 => 'PM_saturday_sunday'
WEEKS_BY_MONTH = { 1 => 4, 2 => 4, 3 => 4, 4 => 5, 5 => 4, 6 => 4, 7 => 5, 8 => 4, 9 => 4, 10 => 5, 11 => 4, 12 => 5 }
TargetProductivity.delete_all
TargetSale.delete_all

stores = Store.where(name: Settings::STORES_ALLOWED).pluck(:id)
departments = Department.where(name: Settings::DEPARTMENTS_ALLOWED).pluck(:id)

StoreDepartment.where(store: stores, department: departments).each do |store_department|
  (2017..2018).each do |year|
    (1..12).each do |month|
      (1..WEEKS_BY_MONTH[month]).each do |week|
        TargetProductivity.create!(store_department: store_department, year: year, month: month, week: week, period: 1, amount: 85000)
        TargetProductivity.create!(store_department: store_department, year: year, month: month, week: week, period: 2, amount: 85000)
        TargetProductivity.create!(store_department: store_department, year: year, month: month, week: week, period: 3, amount: 85000)
        TargetProductivity.create!(store_department: store_department, year: year, month: month, week: week, period: 4, amount: 85000)
        TargetSale.create!(store_department: store_department, year: year, month: month, week: week, amount: 850000)
      end
    end
  end
end

puts 'target_productivities_and_sales loaded'
