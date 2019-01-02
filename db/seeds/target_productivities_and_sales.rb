# periods
# 1 => 'AM_monday_friday'
# 2 => 'PM_monday_friday'
# 3 => 'AM_saturday_sunday'
# 4 => 'PM_saturday_sunday'

stores = Store.where(name: Settings::STORES_ALLOWED).pluck(:id)
departments = Department.where(name: Settings::DEPARTMENTS_ALLOWED).pluck(:id)

StoreDepartment.where(store: stores, department: departments).each do |store_department|
  (1..12).each do |month|
    WEEKS_BY_MONTH[month].times do |i|
      TargetProductivity.create!(store_department: store_department, year: 2018, month: month, week: i+1, period: 1, amount: 85000)
      TargetProductivity.create!(store_department: store_department, year: 2018, month: month, week: i+1, period: 2, amount: 85000)
      TargetProductivity.create!(store_department: store_department, year: 2018, month: month, week: i+1, period: 3, amount: 85000)
      TargetProductivity.create!(store_department: store_department, year: 2018, month: month, week: i+1, period: 4, amount: 85000)
      TargetSale.create!(store_department: store_department, year: 2018, month: month, week: i+1, amount: 85000)
    end
  end
end

puts 'target_productivities_and_sales loaded'
