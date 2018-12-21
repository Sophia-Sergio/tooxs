STORES.each do |store|
  DEPARTMENTS.each do |department|
    StoreDepartment.create!(store: store, department: department)
  end
end

puts 'store_departments loaded'
