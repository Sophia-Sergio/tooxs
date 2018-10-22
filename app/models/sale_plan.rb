class SalePlan < ApplicationRecord
  belongs_to :store
  belongs_to :department
  validates_presence_of :store_id, :department_id

  scope :by_month, ->(month) { where(month: month) }
  scope :by_department, ->(department) { where(department: department) }

  def week
    ##%V - Week number of year according to ISO 8601 (01..53)
    sale_date.strftime('%V').to_i
  end

  def month
    self.sale_date.strftime("%B").to_s
  end

  def day
    self.sale_date.strftime("%A").to_s
  end

  def total_day
    self.nine+self.ten+self.eleven+self.twelve+self.thirteen+self.fourteen+self.fifteen+self.sixteen+self.seventeen+self.eighteen+self.nineteen+self.twenty+self.twenty_one+self.twenty_two+self.twenty_three+self.twenty_four
  end

  def self.from_xlsx(file = '')
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

  def self.days_by_week
    pluck(:week, :sale_date).each_with_object({}) do |week_date, hash|
      (hash[week_date[0]] ||= []) << week_date[1].strftime('%d')
    end
  end

  private

  def parse_integer(dec_num)
    return 0 if dec_num == '-'
    dec_num.to_s.delete('.').to_i
  end

  def import_row(row)

    store = Store.find(row[0])
    return if store.nil?

    sale_plan = SalePlan.find_or_initialize_by(
      store_id: store.id,
      department_id: row[1],
      sale_date: row[2]
    )

    sale_plan.update_attributes(
      nine: parse_integer(row[3]),
      ten: parse_integer(row[4]),
      eleven: parse_integer(row[5]),
      twelve: parse_integer(row[6]),
      thirteen: parse_integer(row[7]),
      fourteen: parse_integer(row[8]),
      fifteen: parse_integer(row[9]),
      sixteen: parse_integer(row[10]),
      seventeen: parse_integer(row[11]),
      eighteen: parse_integer(row[12]),
      nineteen: parse_integer(row[13]),
      twenty: parse_integer(row[14]),
      twenty_one: parse_integer(row[15]),
      twenty_two: parse_integer(row[16]),
      twenty_three: parse_integer(row[17]),
      twenty_four: parse_integer(row[18]),
      week: parse_integer(row[19]),
      month: parse_integer(row[20]),
      year: parse_integer(row[21]),
      day_number: parse_integer(row[22])
    )
  end
end
