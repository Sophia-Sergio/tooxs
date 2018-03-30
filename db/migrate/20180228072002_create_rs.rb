class CreateRs < ActiveRecord::Migration[5.1]
  def change
    create_table :rs do |t|
      t.references :store, foreign_key: true
      t.references :department, foreign_key: true
      t.date :date
      t.integer :year
      t.integer :month
      t.integer :week
      t.integer :dow
      t.bigint :nine
      t.bigint :ten
      t.bigint :eleven
      t.bigint :twelve
      t.bigint :thirteen
      t.bigint :fourteen
      t.bigint :fifteen
      t.bigint :sixteen
      t.bigint :seventeen
      t.bigint :eighteen
      t.bigint :nineteen
      t.bigint :twenty
      t.bigint :twenty_one
      t.bigint :twenty_two
      t.bigint :twenty_three
      t.bigint :total_day

      t.timestamps
    end
  end
end
