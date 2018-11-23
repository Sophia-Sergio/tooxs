class CreateShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :shifts do |t|
      t.string :name, null: false
      t.integer :month_hours, null: false
      t.integer :min_week_hours, null: false, default: 1
      t.timestamps
    end
  end
end
