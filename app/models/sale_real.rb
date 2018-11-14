class SaleReal < ApplicationRecord
  belongs_to :store
  belongs_to :department
  validates_presence_of :store_id, :department_id, :sale_date

  scope :by_department, ->(department) { where(department: department) }
  scope :by_month, ->(month) { where(month: month) }
  scope :by_year, ->(year) { where(year: year) }
  scope :with_month, lambda { |value| where('month = (?)', value) if value }
  scope :btw_dates, lambda{ |date,date2| where("sale_date BETWEEN ? AND ?", date,date2)  if date and date2}

  def week
    ##%V - Week number of year according to ISO 8601 (01..53)
    sale_date.strftime("%V").to_i
  end

  def month
    sale_date.strftime("%B").to_s
  end

  def day
    sale_date.strftime("%A").to_s
  end

  def total_day
    nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four
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

  def self.total_sales(department, month, year)
    sales_by_day(department, month, year).sum
  end

  def self.sales_by_day(department, month, year = Date.today.year)
    sales = by_department(department).by_month(month).by_year(year)
    sales.each_with_object([]) { |sale, array| array << sale.total_day }
  end

  private

  def self.productivity_by_day(staff_by_day)
    hash = each_with_object({}) do |sale, hash|
      (hash[:real_productivity] ||= []) << (sale.total_day.to_f / staff_by_day[@contReal]).round(2)
      @contReal += 1
    end
  end

  def parse_integer(dec_num)
    return 0 if dec_num == '-'
    dec_num.to_s.delete('.').to_i
  end

  def import_row(row)
    store = Store.find(row[0])
    return if store.nil?

    sale_real = SaleReal.find_or_initialize_by(
      store_id: store.id,
      department_id: row[1],
      sale_date: row[2]
    )

    sale_real.update_attributes(
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
