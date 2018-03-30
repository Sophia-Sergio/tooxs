class AddColToHistoricSales < ActiveRecord::Migration[5.1]
  def change
    add_reference :historic_sales, :store, foreign_key: true
  end
end
