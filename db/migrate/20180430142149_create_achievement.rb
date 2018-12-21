class CreateAchievement < ActiveRecord::Migration[5.1]
  def change
    create_table :achievements do |t|
      t.references :user, foreign_key: true
      t.references :store_department, foreign_key: true
      t.references :store, foreign_key: true
      t.date :date
      t.integer :year
      t.integer :month
      t.integer :week
      t.integer :day
      t.timestamps
    end
  end
end
