class CreateSellerSales < ActiveRecord::Migration[5.1]
  def change
    create_table :seller_sales do |t|
      t.references :seller, foreign_key: true
      t.references :department, foreign_key: true
      t.integer :month
      t.integer :week
      t.integer :day
      t.integer :time
      t.float :sale
      t.integer :turn
      t.integer :year
      t.timestamps
    end
  end
end
