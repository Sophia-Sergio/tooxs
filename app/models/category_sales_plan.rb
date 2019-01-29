class CategorySalesPlan < ApplicationRecord
  belongs_to :store
  belongs_to :category, foreign_key: 'category_cod'

  scope :by_store_month, ->(store_id, opts = {}) {
    where(store_id: store_id, year: opts[:year], month: opts[:month])
  }
end
