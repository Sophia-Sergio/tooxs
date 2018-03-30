class CreateSaleReals < ActiveRecord::Migration[5.1]
  def change
    create_table :sale_reals do |t|
      t.references :store, foreign_key: true
      t.references :department, foreign_key: true
      t.date :date_sale
      t.bigint :nine
      t.bigint :ten
      t.bigint :eleven
      t.bigint :twelve
      t.bigint :thirteen
      t.bigint :fourteen
      t.bigint :fifteen
      t.bigint :sixteen
      t.bigint :seventeen
      t.bigint :eigthteen
      t.bigint :nineteen
      t.bigint :twenty
      t.bigint :twenty_one
      t.bigint :twenty_two
      t.bigint :twenty_three
      t.bigint :twenty_four
      t.integer :week
      t.integer :month
      t.integer :year
      t.integer :day_number

      t.timestamps
    end
  end
end
