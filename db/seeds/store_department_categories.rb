STORES.each do |store|
  store.store_departments.where(department: DEPARTMENTS).each do |store_department|
    store_department.categories.delete_all
    store_department.categories << Category.where(cod: Settings::DEMO_DEPARTMENTS[store_department.department.name]['categories'])
  end
end

puts 'store_departments_categories loaded'