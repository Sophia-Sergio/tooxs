class StaffingReal < ApplicationRecord
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

    def parse_integer(dec_num)
      return 0 if dec_num == '-'
      dec_num.to_s.delete('.').to_i
    end

    def import_row(row)

      department = Department.find(row[0])
      return if department.nil?

      staffing_real = StaffingReal.find_or_initialize_by(
        department_id: row[0],
        year: parse_integer(row[1]),
        month: parse_integer(row[2]),
        day: parse_integer(row[3])        
      )

      staffing_real.update_attributes(
        count: parse_integer(row[4])
      )
    end
  end
end
