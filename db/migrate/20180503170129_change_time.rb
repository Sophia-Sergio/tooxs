class ChangeTime < ActiveRecord::Migration[5.1]
  def change
  	rename_column:sale_by_sellers, :time, :hour
  end
end
