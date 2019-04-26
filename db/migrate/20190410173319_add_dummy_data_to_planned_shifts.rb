class AddDummyDataToPlannedShifts < ActiveRecord::Migration[5.2]
  def change
    load "#{Rails.root}/db/seeds/planned_shifts.rb"
  end
end
