class CreateStaffingCases < ActiveRecord::Migration[5.1]
  def change
    create_table :staffing_cases do |t|
      t.references :data_case, foreign_key: true
      t.integer :tolerance
      t.integer :actual_staffing_eval
      t.integer :max_time
      t.string :user
      t.timestamps
    end
  end
end
