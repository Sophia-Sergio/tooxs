class CreateJoinTableDepartmentsCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_store_departments, id: false do |t|
      t.belongs_to :store_department, index: true
      t.string :category_cod, index: true
    end
    execute "ALTER TABLE categories_store_departments ADD FOREIGN KEY (category_cod) REFERENCES categories (cod) ;"
  end
end
