class CreateStaffRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :staff_requests do |t|
      t.references :store_department, foreign_key: true
      t.references :store, foreign_key: true
      t.references :plan_shift, foreign_key: true
      t.integer :cuantity
      t.date :date_start
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
