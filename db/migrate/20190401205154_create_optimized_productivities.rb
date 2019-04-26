class CreateOptimizedProductivities < ActiveRecord::Migration[5.2]
  def change
    create_table :optimized_productivities do |t|
      t.date :date
      t.references :store_department, foreign_key: true
      t.timestamps
    end
  end

end
