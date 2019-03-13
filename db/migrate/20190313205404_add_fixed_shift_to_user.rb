class AddFixedShiftToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fixed_shift, :boolean, default: false
  end
end
