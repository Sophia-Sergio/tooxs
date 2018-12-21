class CreateGeneralPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :general_plans do |t|
      t.references :store_department, foreign_key: true
      t.integer :value, default: 0, null: false
      t.integer :period, default: 0, null: false
      t.timestamps
    end
  end
end
