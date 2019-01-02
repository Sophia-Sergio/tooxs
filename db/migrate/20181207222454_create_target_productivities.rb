class CreateTargetProductivities < ActiveRecord::Migration[5.1]
  def change
    create_table :target_productivities do |t|
      t.references :store_department, foreign_key: true
      t.integer :month, null: false
      t.integer :year, null: false
      t.integer :week, null: false
      t.integer :period, null: false
      t.integer :amount, null: false
      t.timestamps
    end
  end
end
