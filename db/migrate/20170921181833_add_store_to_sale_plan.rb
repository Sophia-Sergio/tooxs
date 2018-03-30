class AddStoreToSalePlan < ActiveRecord::Migration[5.1]
  def change
    add_reference :sale_plans, :store, foreign_key: true
  end
end
