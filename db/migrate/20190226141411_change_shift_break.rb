class ChangeShiftBreak < ActiveRecord::Migration[5.2]
  def change
    add_column :shift_breaks, :check_in, :time
    add_column :shift_breaks, :check_out, :time
    remove_column :shift_breaks, :time
    add_column :shift_breaks, :reason, :integer
    add_column :shift_breaks, :reason_desc, :text
  end
end
