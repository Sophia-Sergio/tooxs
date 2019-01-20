class CreateStoreDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :store_departments do |t|
      t.references :store, foreign_key: true
      t.references :department, foreign_key: true
      t.integer :staff
      t.integer :department_cod
      t.timestamps
    end
  end
end
