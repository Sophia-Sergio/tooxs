class AddColToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :surname_1, :string
    add_column :users, :surname_2, :string
    add_column :users, :picture, :string
    add_column :users, :status, :integer, default: 1
    add_column :users, :rut, :integer
  end
end
