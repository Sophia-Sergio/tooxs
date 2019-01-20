class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.references :brand, foreign_key: true
      t.string :category_cod, index: true
      t.timestamps
    end
    execute "ALTER TABLE products ADD FOREIGN KEY (category_cod) REFERENCES categories (cod) ;"
  end
end
