ActiveRecord::Base.connection.execute("DELETE from categories_store_departments")
UserShift.delete_all
CategorySale.delete_all
Category.delete_all
TargetProductivity.delete_all
TargetSale.delete_all
UserShift.delete_all
WorkedShift.delete_all
Achievement.delete_all
User.delete_all
StoreDepartment.delete_all
Store.delete_all
Cluster.delete_all
Department.delete_all
PlanShift.delete_all
WorkShift.delete_all

puts 'previuos data deleted'
