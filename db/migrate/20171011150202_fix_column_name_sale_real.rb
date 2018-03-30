class FixColumnNameSaleReal < ActiveRecord::Migration[5.1]
  def change
  	rename_column :sale_reals, :eigthteen, :eighteen
  	rename_column :sale_reals, :date_sale, :sale_date
  end
end
