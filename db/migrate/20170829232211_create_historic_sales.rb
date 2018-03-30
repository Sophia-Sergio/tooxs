class CreateHistoricSales < ActiveRecord::Migration[5.1]
  def change
    create_table :historic_sales do |t|
      t.references :department, foreign_key: true
      t.integer :month, null: false
      t.integer :week, null: false
      t.string :day, null: false
      t.bigint :nine, default: 0
      t.bigint :ten, default: 0
      t.bigint :eleven, default: 0
      t.bigint :twelve, default: 0
      t.bigint :thirteen, default: 0
      t.bigint :fourteen, default: 0
      t.bigint :fifteen, default: 0
      t.bigint :sixteen, default: 0
      t.bigint :seventeen, default: 0
      t.bigint :eighteen, default: 0
      t.bigint :nineteen, default: 0
      t.bigint :twenty, default: 0
      t.bigint :twenty_one, default: 0
      t.bigint :twenty_two, default: 0
      t.bigint :twenty_three, default: 0
      t.bigint :twenty_four, default: 0

      t.timestamps
    end
  end
end
