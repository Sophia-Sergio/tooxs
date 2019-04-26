class CreatePlannedShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :planned_shifts do |t|
      t.references :user, foreign_key: true
      t.references :work_shift, foreign_key: true
      t.datetime :check_in
      t.datetime :check_out
      t.date :date

      t.timestamps
    end
  end
end
