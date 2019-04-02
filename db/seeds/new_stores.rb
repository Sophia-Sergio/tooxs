STORES = Store.where(name: ['Parque Arauco', 'Arauco Maipú'])

STORES.each do |store|
  store.departments.delete_all
  Department.where(name: ['Audio y Video', 'Blanco', 'Computación y Hogar']).each do |department|
    store_department = StoreDepartment.new(store: store,
      department: department,
      department_cod: Settings::DEMO_DEPARTMENTS[department.name]['cod'] ,
      staff: Settings::DEMO_DEPARTMENTS[department.name]['staff_type'] ,
      world: World.find_by(name: Settings::DEMO_DEPARTMENTS[department.name]['world']))
    store_department.save!
    store_department.categories.delete_all
    store_department.categories << Category.where(cod: Settings::DEMO_DEPARTMENTS[store_department.department.name]['categories'])
  end
end

store = Store.find_by(name: 'Parque Arauco')
store_main = Store.find_by(name: 'Alto Las Condes')
categories = Category.where(cod: StoreDepartment.where(store: store).joins(:categories).pluck(:category_cod).uniq)
CategorySale.where(category: categories).where(store: store).delete_all
categories.each do |category|
  date = Date.new(2017, 1, 2)
  (2017..2019).each do
    (1..12).each do |month|
      weeks = Settings.weeks_by_month[month]
      (1..weeks).each do
        (1..7).each do
          sale_day = CategorySale.find_by(date: date, category: category, store: store_main).amount * rand(0.7..0.95)
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
