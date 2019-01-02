class CreatePlanShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :plan_shifts do |t|
      t.references :work_shift, foreign_key: true
      t.integer :week
      t.integer :day
      t.time :check_in
      t.time :check_out
      t.timestamps
    end
  end
end
