class CreateSps < ActiveRecord::Migration[5.1]
  def change
    create_table :sps do |t|
      t.references :store, foreign_key: true
      t.references :department, foreign_key: true
      t.date :date
      t.integer :year
      t.integer :month
      t.integer :week
      t.integer :dow
      t.integer :sale

      t.timestamps
    end
  end
end
