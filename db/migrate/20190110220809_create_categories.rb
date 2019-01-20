class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories, id: false do |t|
      t.string :cod, index: true
      t.string :name
      t.integer :level
      t.string :parent_cod, index: true
      t.string :parents, array: true, default: '{}'
      t.timestamps
    end
    execute "ALTER TABLE categories ADD PRIMARY KEY (cod);"
  end
end
