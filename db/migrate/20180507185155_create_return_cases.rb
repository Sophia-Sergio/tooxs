class CreateReturnCases < ActiveRecord::Migration[5.1]
  def change
    create_table :return_cases do |t|
      t.integer :id_case
      t.string :eff_margin
      t.integer :total_surplus
      t.string :compensation_cost
      t.string :integer
      t.string :status
      t.string :user
      t.string :message
      t.integer :deficit_total
      t.string :tolerance
      t.string :version
      t.string :format_result
      t.string :max_time
      t.string :lunchs
      t.string :turns
      t.string :delta
      t.string :epsilon
      t.string :support
      t.string :model
      t.integer :sales_plan
      t.integer :obj_function

      t.timestamps
    end
  end
end
