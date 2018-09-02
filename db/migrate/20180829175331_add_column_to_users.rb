class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :phone, :string
	add_column :users, :street, :string
	add_column :users, :number, :string
	add_column :users, :city, :string
	add_column :users, :district, :string
	add_column :users, :county, :string  
	add_column :users, :country, :string  
	add_reference :users, :department, foreign_key: true
	add_reference :users, :store, foreign_key: true
	add_column :users, :assigned_shift, :integer
	add_column :users, :begin_shift, :date    	
    change_column :users, :rut, :string
  end
end
