class FixColNameSalePlan < ActiveRecord::Migration[5.1]
  def change
  	rename_column :sale_plans, :eigthteen, :eighteen
  end
end
