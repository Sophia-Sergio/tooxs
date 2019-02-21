class CategorySale < ApplicationRecord
  belongs_to :category, foreign_key: 'category_cod'
  belongs_to :store

  scope :by_cluster, ->(cluster = nil) { where(cluster_id: cluster).order(:name) }
  scope :between, ->(period) { where('date between ? AND ?', period[:start], period[:end]) }

  def self.total
    sum(:amount)
  end
end
