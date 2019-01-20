class CreateCategorySales < ActiveRecord::Migration[5.1]
  def change
    create_table :category_sales do |t|
      t.date :date
      t.string :category_cod, index: true
      t.integer :amount
      t.references :store, foreign_key: true
      t.timestamps
    end
    execute "ALTER TABLE category_sales ADD FOREIGN KEY (category_cod) REFERENCES categories (cod) ;"
  end
end
