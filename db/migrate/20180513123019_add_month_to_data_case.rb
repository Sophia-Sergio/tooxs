class AddMonthToDataCase < ActiveRecord::Migration[5.1]
  def change
  	add_column :data_cases, :month, :integer
  end
end
