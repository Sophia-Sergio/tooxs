class StaffingReal < ApplicationRecord
  extend UniqCaseFilter::StaffingReal

  belongs_to :department
  belongs_to :store

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

    def parse_integer(dec_num)
      return 0 if dec_num == '-'
      dec_num.to_s.delete('.').to_i
    end

    def import_row(row)

      department = Department.find(row[0])
      return if department.nil?

      staffing_real = StaffingReal.find_or_initialize_by(
        store_id: row[0],
        department_id: row[1],
        year: parse_integer(row[2]),
        month: parse_integer(row[3]),
        day: parse_integer(row[4]),
        hour: parse_integer(row[5])
      )

      staffing_real.update_attributes(
        count: parse_integer(row[6])
      )
    end
  end
end
