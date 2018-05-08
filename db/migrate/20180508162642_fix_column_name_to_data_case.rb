class FixColumnNameToDataCase < ActiveRecord::Migration[5.1]
  def change
  	rename_column :data_cases, :luch_in, :lunch_in
  end
end
