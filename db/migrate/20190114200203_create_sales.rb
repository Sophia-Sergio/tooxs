class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.datetime :date
      t.references :user, foreign_key: true
      t.references :product, foreign_key: true
      t.references :store_department, foreign_key: true
      t.integer :amount
      t.timestamps
    end
  end
end
