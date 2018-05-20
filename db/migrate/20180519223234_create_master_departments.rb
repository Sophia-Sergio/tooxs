class CreateMasterDepartments < ActiveRecord::Migration[5.1]
  def change
    create_table :master_departments do |t|
      t.string :name

      t.timestamps
    end
  end
end
