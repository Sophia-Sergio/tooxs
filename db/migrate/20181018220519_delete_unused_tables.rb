class DeleteUnusedTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :rs
    drop_table :hs
    drop_table :historic_sales
    drop_table :sps
  end
end
