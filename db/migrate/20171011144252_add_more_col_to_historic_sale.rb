class AddMoreColToHistoricSale < ActiveRecord::Migration[5.1]
  def change
    add_column :historic_sales, :week, :integer
    add_column :historic_sales, :month, :integer
    add_column :historic_sales, :year, :integer
    add_column :historic_sales, :day_number, :integer
  end
end
