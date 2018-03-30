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
      t.boolean :ten
      t.boolean :eleven
      t.boolean :twelve
      t.boolean :thirteen
      t.boolean :fourteen
      t.boolean :fifteen
      t.boolean :sixteen
      t.boolean :seventeen
      t.boolean :eighteen
      t.boolean :nineteen
      t.boolean :twenty
      t.boolean :twenty_one
      t.boolean :twenty_two
      t.boolean :twenty_three
      t.boolean :twenty_four

      t.timestamps
    end
  end
end
