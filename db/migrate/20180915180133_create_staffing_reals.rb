class CreateStaffingReals < ActiveRecord::Migration[5.1]
  def change
    return if table_exists?(:staffing_reals)

    create_table :staffing_reals do |t|
      t.references :department, foreign_key: true
      t.integer :year
      t.integer :month
      t.integer :day
      t.integer :count

      t.timestamps
    end
  end
end
