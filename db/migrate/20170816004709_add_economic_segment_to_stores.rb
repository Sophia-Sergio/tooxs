class AddEconomicSegmentToStores < ActiveRecord::Migration[5.1]
  def change
    add_column :stores, :economic_segment, :string
  end
end
