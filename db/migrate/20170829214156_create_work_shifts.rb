class CreateWorkShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :work_shifts do |t|
      t.string :name, null: false
      t.integer :week_hours, null: false
      t.timestamps
    end
  end
end
