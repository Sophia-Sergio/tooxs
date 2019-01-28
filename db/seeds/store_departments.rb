departments = Settings::DEMO_DEPARTMENTS
staff_type = {
  1 => 'asisted',
  2 => 'selfasisted',
  3 => 'personalized'
}

STORES.each do |store|
  DEPARTMENTS.each do |department|
    StoreDepartment.create!(store: store,
      department: department,
      department_cod: departments[department.name]['cod'] ,
      staff: departments[department.name]['staff_type'] ,
      world: World.find_by(name: departments[department.name]['world']))
  end
end

puts 'store_departments loaded'
