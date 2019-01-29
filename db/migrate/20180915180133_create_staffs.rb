class CreateStaffs < ActiveRecord::Migration[5.1]
  def change
    create_table :staffs do |t|
      t.references :store_department, foreign_key: true
      t.date :date
      t.integer :staff_number
      t.string :type
      t.timestamps
    end
  end
end
