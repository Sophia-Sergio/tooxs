class CreateSummaryCases < ActiveRecord::Migration[5.1]
  def change
    create_table :summary_cases do |t|
      t.references :data_case, foreign_key: true
      t.integer :sale_plan
      t.integer :coverange_deficit
      t.integer :surplus_coverange
      t.integer :total_deviation
      t.integer :cost_of_remunerations
      t.decimal :margin_adjustment
      t.timestamps
    end
  end
end
