class CreateWorkedShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :worked_shifts do |t|
      t.integer :month, null: false
      t.integer :week, null: false
      t.string  :day, null: false
      t.boolean :nine, null: false, default: false
      t.boolean :ten, null: false, default: false
      t.boolean :eleven, null: false, default: false
      t.boolean :twelve, null: false, default: false
      t.boolean :thirteen, null: false, default: false
      t.boolean :fourteen, null: false, default: false
      t.boolean :fifteen, null: false, default: false
      t.boolean :sixteen, null: false, default: false
      t.boolean :seventeen, null: false, default: false
      t.boolean :eighteen, null: false, default: false
      t.boolean :nineteen, null: false, default: false
      t.boolean :twenty, null: false, default: false
      t.boolean :twenty_one, null: false, default: false
      t.boolean :twenty_two, null: false, default: false
      t.boolean :twenty_three, null: false, default: false
      t.boolean :twenty_four, null: false, default: false
      t.timestamps
    end
  end
end
