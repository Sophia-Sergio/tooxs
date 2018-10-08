class CreateDataCases < ActiveRecord::Migration[5.1]
  def change
    create_table :data_cases do |t|
      t.integer :id_case
      t.integer :turn_num
      t.integer :dep_num
      t.integer :day_num
      t.integer :hour_day
      t.float :hp_val
      t.float :prod_obj
      t.string :vhp
      t.string :pov
      t.string :luch_in
      t.string :lunch_hours
      t.integer :hour_min
      t.string :turns_matrix
      t.string :real_dot
      t.string :sale_plan

      t.timestamps
    end
  end
end
