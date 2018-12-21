class CreateDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.integer :staff_type
      t.timestamps
    end
  end
end
