class AddRealDotToSummaryCases < ActiveRecord::Migration[5.1]
  def change
  	add_column :summary_cases, :real_dot, :string
  end
end
