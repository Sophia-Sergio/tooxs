class ChangeStoreId < ActiveRecord::Migration[5.1]
  def change
  	rename_column:sale_by_sellers, :store_id, :department
  end
end
