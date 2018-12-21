class AddStatusToSellerShift < ActiveRecord::Migration[5.1]
  def change
    add_column :user_shifts, :status, :integer, default: 1
  end
end
