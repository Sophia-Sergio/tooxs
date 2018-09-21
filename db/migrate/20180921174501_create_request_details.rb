class CreateRequestDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :request_details do |t|
      t.integer :request_id
      t.integer :department_id
      t.integer :turn
      t.integer :quantity
      t.integer :rrhh
      t.integer :internal
      t.integer :laborum
      t.integer :trabajando

      t.timestamps
    end
  end
end
