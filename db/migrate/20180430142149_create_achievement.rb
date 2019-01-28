class CreateAchievement < ActiveRecord::Migration[5.1]
  def change
    enable_extension "hstore"
  end
  def change
    create_table :achievements do |t|
      t.references :user, foreign_key: true
      t.references :store_department, foreign_key: true
      t.references :store, foreign_key: true
      t.date :date
      t.timestamps
    end
    add_column :achievements, :achievement, :hstore, default: {}, null: false
  end
end
