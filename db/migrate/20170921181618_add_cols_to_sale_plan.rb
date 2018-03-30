class AddColsToSalePlan < ActiveRecord::Migration[5.1]
  def change
    add_column :sale_plans, :sale_date, :date
    add_column :sale_plans, :nine, :bigint
    add_column :sale_plans, :ten, :bigint
    add_column :sale_plans, :eleven, :bigint
    add_column :sale_plans, :twelve, :bigint
    add_column :sale_plans, :thirteen, :bigint
    add_column :sale_plans, :fourteen, :bigint
    add_column :sale_plans, :fifteen, :bigint
    add_column :sale_plans, :sixteen, :bigint
    add_column :sale_plans, :seventeen, :bigint
    add_column :sale_plans, :eigthteen, :bigint
    add_column :sale_plans, :nineteen, :bigint
    add_column :sale_plans, :twenty, :bigint
    add_column :sale_plans, :twenty_one, :bigint
    add_column :sale_plans, :twenty_two, :bigint
    add_column :sale_plans, :twenty_three, :bigint
    add_column :sale_plans, :twenty_four, :bigint
  end
end
