class AddColsToSeller < ActiveRecord::Migration[5.1]
  def change
    add_reference :sellers, :store, foreign_key: true
    add_column :sellers, :assigned_shift, :integer
    add_column :sellers, :begin_shift, :date
  end
end
