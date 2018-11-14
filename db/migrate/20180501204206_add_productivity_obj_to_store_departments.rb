class AddProductivityObjToStoreDepartments < ActiveRecord::Migration[5.1]
  def change
    add_column :store_departments, :productivity_obj, :float
  end
end
