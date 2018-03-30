class AddOriginIdToStores < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :origin_id, :integer
    add_index :stores, :origin_id
  end
end
