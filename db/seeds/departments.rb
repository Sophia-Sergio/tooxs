staff_type = {
  1 => 'asisted',
  2 => 'selfasisted',
  3 => 'personalized'
}

departments = Settings::DEPARTMENTS_ALLOWED

departments.each do |department|
  Department.create!(name: department)
end

puts 'departments loaded'
