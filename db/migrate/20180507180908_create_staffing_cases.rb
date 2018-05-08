class CreateStaffingCases < ActiveRecord::Migration[5.1]
  def change
    create_table :staffing_cases do |t|
      t.integer :id_case
      t.integer :tolerance
      t.integer :actual_staffing_eval
      t.integer :max_time
      t.string :user

      t.timestamps
    end
  end
end
