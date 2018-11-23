class CreateSellerShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :seller_shifts do |t|
      t.references :shift, foreign_key: true
      t.integer :month
      t.timestamps
    end
  end
end
