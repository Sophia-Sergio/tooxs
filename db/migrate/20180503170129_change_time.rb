class ChangeTime < ActiveRecord::Migration[5.1]
  def change
  	rename_column:seller_sales, :time, :hour
  end
end
