class AddCountyToStores < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :county, :string
  end
end
