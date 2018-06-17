class CreateStaffingReals < ActiveRecord::Migration[5.1]
  def change
    create_table :staffing_reals do |t|
      t.integer :seller
      t.date :date
      t.integer :hour
      t.integer :department

      t.timestamps
    end
  end
end
