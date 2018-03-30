class AddColToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :lastname, :string
    add_column :users, :surname, :string
    add_column :users, :role, :integer
    add_column :users, :picture, :string
    add_column :users, :status, :integer
    add_column :users, :position, :string
    add_column :users, :rut, :integer
  end
end
