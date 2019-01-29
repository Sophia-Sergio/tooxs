class AddWorldToStoreDepartments < ActiveRecord::Migration[5.1]
  def change
    add_reference :store_departments, :world, foreign_key: true
  end
end
