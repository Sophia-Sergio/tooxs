class AddAchievementToAchievements < ActiveRecord::Migration[5.1]
  def change
    add_column :achievements, :achievement, :hstore, default: {}, null: false
  end
end
