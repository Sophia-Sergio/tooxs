class AddTotalDayToAchievement < ActiveRecord::Migration[5.1]
  def change
    add_column :achievements, :total_day, :integer
  end
end
