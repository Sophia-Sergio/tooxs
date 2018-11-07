# class for table departments
class StoreDepartment < ApplicationRecord
  belongs_to :store
  belongs_to :department
  # has_many :sellers
  # has_many :users
  # has_many :request_detail
  validates_presence_of :name, :origin_id

  def to_s
    name
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
      store = Store.find_by_origin_id(row[0])
      return if store.nil?
      department = Department.find_or_initialize_by(origin_id: row[1])
      department.update_attributes(
        name: row[2],
        store_id: store.id
      )

      department.save
    end
  end

  def to_s
    name
  end

end
