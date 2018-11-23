class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.references :store, foreign_key: true
      t.references :department, foreign_key: true
      t.date :sale_date
      t.integer :week
      t.integer :month
      t.integer :year
      t.integer :day_number
      t.integer :nine
      t.integer :ten
      t.integer :eleven
      t.integer :twelve
      t.integer :thirteen
      t.integer :fourteen
      t.integer :fifteen
      t.integer :sixteen
      t.integer :seventeen
      t.integer :eighteen
      t.integer :nineteen
      t.integer :twenty
      t.integer :twenty_one
      t.integer :twenty_two
      t.integer :twenty_three
      t.integer :twenty_four
      t.string :type
      t.timestamps
    end
  end
end
