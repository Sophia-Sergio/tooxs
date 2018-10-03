class AddNewValuesToStaffingReals < ActiveRecord::Migration[5.1]
  def change
    add_column :staffing_reals, :hour, :integer
    add_column :staffing_reals, :store_id, :integer
  end
end
