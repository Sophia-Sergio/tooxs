class Category < ApplicationRecord
  has_and_belongs_to_many :store_departments, foreign_key: 'category_cod'
  belongs_to :parent,-> { where(level: [2,3,4]) }, class_name: 'Category', foreign_key: 'parent_cod', optional: true
  has_many :childs, class_name: 'Category', foreign_key: 'parent_cod', dependent: :destroy
  has_many :sales, class_name: 'CategorySale', foreign_key: 'category_cod'
  has_many :sales_plans, class_name: 'CategorySalesPlan', foreign_key: 'category_cod'
  has_many :products

  enum level: {
    line: 1,
    subline: 2,
    main: 3,
    subcategory: 4
  }

  Category.levels.keys.each do |attribute|
    define_method "is_#{attribute}?".to_sym do
      attributte?
    end
  end
end
