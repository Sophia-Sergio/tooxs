class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :level
      t.integer :parent_id
      t.string :cod
      t.timestamps
    end
  end
end
