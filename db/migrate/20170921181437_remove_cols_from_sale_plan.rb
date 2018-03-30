class RemoveColsFromSalePlan < ActiveRecord::Migration[5.1]
  def change
    remove_column :sale_plans, :month, :integer
    remove_column :sale_plans, :sales, :bigint
  end
end
