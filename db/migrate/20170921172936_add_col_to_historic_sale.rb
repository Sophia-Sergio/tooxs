class AddColToHistoricSale < ActiveRecord::Migration[5.1]
  def change
    add_column :historic_sales, :historic_date, :date, after: :week
  end
end
