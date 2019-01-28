class CategorySale < ApplicationRecord
  belongs_to :category, foreign_key: 'category_cod'
  belongs_to :store

  scope :by_cluster, ->(cluster = nil) { where(cluster_id: cluster).order(:name) }
  scope :between, ->(start_date, end_date) { where('date between ? AND ?', start_date, end_date) }

  def self.total
    sum(:amount)
  end
end
