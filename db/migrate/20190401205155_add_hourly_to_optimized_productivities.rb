class AddHourlyToOptimizedProductivities < ActiveRecord::Migration[5.1]
  def change
    enable_extension "hstore"
    add_column :optimized_productivities, :hourly, :hstore, default: {}, null: false
  end
end
