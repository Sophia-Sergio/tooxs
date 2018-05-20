class AddMasterIdToDepartments < ActiveRecord::Migration[5.1]
  def change
  	add_column :departments, :master_id, :integer
  end
end
