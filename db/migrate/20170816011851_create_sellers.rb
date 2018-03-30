class CreateSellers < ActiveRecord::Migration[5.1]
  def change
    create_table :sellers do |t|
      t.string :rut
      t.string :name
      t.string :lastname
      t.string :email
      t.string :phone
      t.string :street
      t.string :number
      t.string :city
      t.string :district
      t.string :county
      t.string :country
      t.references :department, foreign_key: true

      t.timestamps
    end
  end
end
