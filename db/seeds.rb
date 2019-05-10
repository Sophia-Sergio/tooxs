# # initial data for demo
# WEEKS_BY_MONTH = { 1 => 4, 2 => 4, 3 => 4, 4 => 5, 5 => 4, 6 => 4, 7 => 5, 8 => 4, 9 => 4, 10 => 5, 11 => 4, 12 => 5 }
# STORES = Store.where(name: Settings::STORES_ALLOWED)
# DEPARTMENTS = Department.where(name: Settings::DEMO_DEPARTMENTS.keys)

# seeds = [
#   'delete_all',
#   'worlds',
#   'clusters',
#   'categories',
#   'roles',
#   'stores',
#   'departments',
#   'store_departments',
#   'store_department_categories',
#   'target_productivities_and_sales',
#   'users',
#   'employees',
#   'work_shifts',
#   'plan_shifts',
#   'user_shifts_and_worked_shifts',
#   'category_sales_and_category_sales_plans',
#   'achievements',
#   'new_stores',
#   'new_stores2',
#   'update_first_day_users',
#   'shift_breaks',
#   'new_users_role',
#   'juvenil_mujer_test'
# ]

# seeds.each do |seed|
#   load "#{Rails.root}/db/seeds/#{seed}.rb"
# end

# Employee.where(id: (445..454).to_a).each do |employee|
#   employee.achievements.each do |a|
#     achievement = a.achievement.each_with_object({}) do |(k, v), hash|
#       hash[k] = v.to_i / 5
#     end
#     a.achievement = achievement
#     a.save
#   end
# end


