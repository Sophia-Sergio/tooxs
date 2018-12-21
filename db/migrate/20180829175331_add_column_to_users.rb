class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :commune, :string
    add_reference :users, :store_department, foreign_key: true
    add_reference :users, :store, foreign_key: true
    change_column :users, :rut, :string
  end
end
