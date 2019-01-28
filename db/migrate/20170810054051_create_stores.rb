class CreateStores < ActiveRecord::Migration[5.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.string :commune
      t.references :cluster, foreign_key: true
      t.timestamps
    end
  end
end
