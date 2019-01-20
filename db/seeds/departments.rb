
departments = Settings::DEMO_DEPARTMENTS

departments.keys.each do |name|
  Department.create!(name: name)
end

puts 'departments loaded'
