class AddColumnYearToDataCases < ActiveRecord::Migration[5.1]
  def change
  	add_column :data_cases, :year, :integer
  end
end
