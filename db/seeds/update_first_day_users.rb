Employee.all.each do |employee|
  random = [employee.created_at - 1.year, employee.created_at - 2.year, employee.created_at - 3.months]
  employee.first_day = random.sample
  employee.save
end