class AddTypeToSummaryCase < ActiveRecord::Migration[5.1]
  def change
  	add_column :summary_cases, :type_io, :string
  end
end
