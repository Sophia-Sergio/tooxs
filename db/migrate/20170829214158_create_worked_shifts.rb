class CreateWorkedShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :worked_shifts do |t|
      t.references :user, foreign_key: true
      t.date :date
      t.datetime :check_in
      t.datetime :check_out
      t.timestamps
    end
  end
end
