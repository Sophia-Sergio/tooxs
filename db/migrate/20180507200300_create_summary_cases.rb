class CreateSummaryCases < ActiveRecord::Migration[5.1]
  def change
    create_table :summary_cases do |t|
      t.integer :id_case
      t.string :sale_plan
      t.string :coverange_deficit
      t.string :surplus_coverange
      t.string :total_deviation
      t.string :cost_of_remunerations
      t.string :margin_adjustment

      t.timestamps
    end
  end
end
