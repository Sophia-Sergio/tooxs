class AddWeekAndYearToSalePlan < ActiveRecord::Migration[5.1]
  def change
    add_column :sale_plans, :week, :integer
    add_column :sale_plans, :month, :integer
    add_column :sale_plans, :year, :integer
    add_column :sale_plans, :day_number, :integer
  end
end
