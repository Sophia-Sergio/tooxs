class CreateStoreDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :store_departments do |t|
      t.integer :origin_id
      t.string :name
      t.references :store, foreign_key: true
      t.references :department, foreign_key: true
      t.timestamps
    end
    add_index :store_departments, :origin_id
  end
end
