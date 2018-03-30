class CreateSalePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :sale_plans do |t|
      t.references :department, foreign_key: true
      t.integer :month
      t.bigint :sales

      t.timestamps
    end
  end
end
