class SellerSale < ApplicationRecord
  belongs_to :seller
  belongs_to :department

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
      department = Department.find_by_origin_id(row[5])
      seller = Seller.find(row[0])
      sale = SellerSale.find_or_initialize_by(
		seller: seller.id,
		month: row[1],
		week: row[2],
		day: row[3],
		hour: row[4],
		department: department.id,
		sale: row[6],
		turn: row[7],
		year: row[8]
      )
      sale.save()
    end
  end
end
