class AddHourlyToCategorySale < ActiveRecord::Migration[5.1]
  def change
    enable_extension "hstore"
    add_column :category_sales, :hourly, :hstore, default: {}, null: false
  end
end
