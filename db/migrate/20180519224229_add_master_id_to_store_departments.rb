class AddMasterIdToStoreDepartments < ActiveRecord::Migration[5.1]
  def change
  	add_column :store_departments, :master_id, :integer
  end
end
