class CreateUserShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :user_shifts do |t|
      t.references :store, foreign_key: true
      t.references :work_shift, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :year
      t.integer :month
      t.integer :week
      t.timestamps
    end
  end
end
