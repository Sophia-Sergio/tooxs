class CreateDataCases < ActiveRecord::Migration[5.1]
  def change
    create_table :data_cases do |t|
      t.integer :turn_num
      t.references :store_department, foreign_key: true
      t.integer :day_num
      t.integer :hour_day
      t.float :hp_val
      t.float :target_productivity
      t.string :vhp
      t.string :pov
      t.string :lunch_in
      t.string :lunch_hours
      t.integer :hour_min
      t.string :turns_matrix
      t.string :real_dot
      t.string :sale_plan
      t.timestamps
    end
  end
end
