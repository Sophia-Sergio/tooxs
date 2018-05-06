class AddProductivityObjToDepartments < ActiveRecord::Migration[5.1]
  def change
    add_column :departments, :productivity_obj, :float
  end
end
