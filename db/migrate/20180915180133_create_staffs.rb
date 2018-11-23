class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.references :department, foreign_key: true
      t.references :store, foreign_key: true
      t.integer :year
      t.integer :month
      t.integer :week
      t.integer :day
      t.integer :staff_number
      t.string :type
      t.timestamps
    end
  end
end
