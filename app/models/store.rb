require 'rubyXL'

# Store class for stores table
class Store < ApplicationRecord
  has_many :users
  has_many :sellers
  has_many :cashiers
  has_many :achievements
  has_many :store_departments
  has_many :worlds, through: :store_departments
  has_many :departments, through: :store_departments
  has_many :staff_reals
  belongs_to :cluster
  validates_presence_of :name,
                        :commune

  scope :by_cluster, ->(cluster = nil) { where(cluster_id: cluster).order(:name) }

  def to_s
    name
  end

  def self.available_shifts
    includes(:available_shifts).all
  end

  class << self
    def from_xlsx(file = '')
      return if file.blank?
      worksheet = RubyXL::Parser.parse(file)[0]

      worksheet.each_with_index do |row, i|
        next if i.zero?
        values = []
        row && row.cells.each do |cell|
          val = cell && cell.value
          values << val
        end
        import_row(values)
      end
    end

    private

    def import_row(row)
      store = Store.find_or_initialize_by(origin_id: row[0])
      store.update_attributes(
        name: row[1],
        street: row[2],
        number: row[3],
        city: row[4],
        district: row[5],
        county: row[6],
        country: row[7],
        size: row[8],
        economic_segment: row[9]
      )
    end
  end
end
