class AddTotalDayToAchievements < ActiveRecord::Migration[5.1]
  def change
    add_column :achievements, :total_day, :bigint
  end
end
