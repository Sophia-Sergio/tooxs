class CreateSaleBySellers < ActiveRecord::Migration[5.1]
  def change
    create_table :sale_by_sellers do |t|
      t.integer :seller
      t.integer :month
      t.integer :week
      t.integer :day
      t.integer :time
      t.integer :store_id
      t.float :sale
      t.integer :turn
      t.integer :year

      t.timestamps
    end
  end
end
