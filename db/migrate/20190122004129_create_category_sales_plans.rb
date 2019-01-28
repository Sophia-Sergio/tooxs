class CreateCategorySalesPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :category_sales_plans do |t|
      t.references :store, foreign_key: true
      t.string :category_cod
      t.integer :year
      t.integer :month
      t.bigint :monthly
      t.timestamps
    end
    execute "ALTER TABLE category_sales_plans ADD FOREIGN KEY (category_cod) REFERENCES categories (cod);"
    enable_extension "hstore"
    add_column :category_sales_plans, :weekly, :hstore, default: {}, null: false
    add_column :category_sales_plans, :daily, :hstore, default: {}, null: false
  end
end
