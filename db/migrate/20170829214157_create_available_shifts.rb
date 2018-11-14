class CreateAvailableShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :available_shifts do |t|
      t.references :store, foreign_key: true
      t.integer :num
      t.string :name
      t.integer :month
      t.integer :week
      t.string :day
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
