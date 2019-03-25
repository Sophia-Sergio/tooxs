TargetProductivity.delete_all
TargetSale.delete_all

stores = Store.where(name: Settings::STORES_ALLOWED).pluck(:id)

StoreDepartment.where(store: stores, department: DEPARTMENTS).each do |store_department|
  (2017..2019).each do |year|
    (1..12).each do |month|
      (1..WEEKS_BY_MONTH[month]).each do |week|
        TargetProductivity.create!(store_department: store_department, year: year, month: month, week: week, period: 1, amount: 75000)
        TargetProductivity.create!(store_department: store_department, year: year, month: month, week: week, period: 2, amount: 95000)
        TargetProductivity.create!(store_department: store_department, year: year, month: month, week: week, period: 3, amount: 115000)
        TargetProductivity.create!(store_department: store_department, year: year, month: month, week: week, period: 4, amount: 105000)
      end
    end
  end
end

puts 'target_productivities_and_sales loaded'
