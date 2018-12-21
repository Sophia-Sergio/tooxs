class CreateShiftBreaks < ActiveRecord::Migration[5.1]
  def change
    create_table :shift_breaks do |t|
      t.references :user, foreign_key: true
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
