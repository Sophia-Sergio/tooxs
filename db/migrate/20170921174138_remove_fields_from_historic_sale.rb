class RemoveFieldsFromHistoricSale < ActiveRecord::Migration[5.1]
  def change
    remove_column :historic_sales, :month, :integer
    remove_column :historic_sales, :week, :integer
    remove_column :historic_sales, :day, :string
  end
end
