class AddSizeToStores < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :size, :string
  end
end
