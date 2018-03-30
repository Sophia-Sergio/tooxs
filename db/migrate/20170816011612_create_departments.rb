class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.integer :origin_id
      t.string :name
      t.references :store, foreign_key: true

      t.timestamps
    end
    add_index :departments, :origin_id
  end
end
