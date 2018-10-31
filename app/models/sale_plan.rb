class SalePlan < ApplicationRecord
  belongs_to :store
  belongs_to :department
  validates_presence_of :store_id, :department_id

  scope :by_day_number, ->(week_day) { where(day_number: week_day) }
  scope :by_department, ->(department) { where(department: department) }
  scope :by_year_and_month, ->(year, month) { where(year: year, month: month).order(:sale_date) }

  def week_of_year
    sale_date.strftime('%V').to_i
  end

  # def month
  #   self.sale_date.strftime("%B").to_s
  # end

  def day
    self.sale_date.strftime("%A").to_s
  end

  def total_day
    (
      nine + ten + eleven + twelve + thirteen + fourteen + fifteen +
      + sixteen + seventeen + eighteen + nineteen + twenty +
      twenty_one + twenty_two + twenty_three + twenty_four
    )
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
    all.each_with_object({}) do |sale_plan, hash|
      (hash[sale_plan.week] ||= []) << sale_plan.sale_date.strftime('%d')
    end
  end

  def self.sales_by_week
    all.each_with_object({}) do |sale_plan, hash|
      (hash[sale_plan.week] ||= []) << sale_plan.total_day
    end
  end

  def to_hour
    # busco la venta por hora del año anterior
    historic_sale = SaleReal.where(year: year-1, week: week, month: month).first

    nine          = (historic_sale[:nine].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
    ten           = (historic_sale.ten.to_f / historic_sale.total_day.to_f ) * total_day.to_f
    eleven        = (historic_sale[:eleven].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
    twelve        = (historic_sale[:twelve].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
    thirteen      = (historic_sale[:thirteen].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
    fourteen      = (historic_sale[:fourteen].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
    fifteen       = (historic_sale[:fifteen].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
    sixteen       = (historic_sale[:sixteen].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
    seventeen     = (historic_sale[:seventeen].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
    eighteen      = (historic_sale[:eighteen].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
    nineteen      = (historic_sale[:nineteen].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
    twenty        = (historic_sale[:twenty].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
    twenty_one    = (historic_sale[:twenty_one].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
    twenty_two    = (historic_sale[:twenty_two].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
    twenty_three  = (historic_sale[:twenty_three].to_f / historic_sale[:total_day].to_f ) * total_day.to_f

    hourly = {
      :nine => nine.nan? || nine.infinite? ? 0 : nine.to_i,
      :ten => ten.nan? || ten.infinite? ? 0 : ten.to_i,
      :eleven => eleven.nan? || eleven.infinite? ? 0 : eleven.to_i,
      :twelve => twelve.nan? || twelve.infinite? ? 0 : twelve.to_i,
      :thirteen => thirteen.nan? || thirteen.infinite? ? 0 : thirteen.to_i,
      :fourteen => fourteen.nan? || fourteen.infinite? ? 0 : fourteen.to_i,
      :fifteen => fifteen.nan? || fifteen.infinite? ? 0 : fifteen.to_i,
      :sixteen => sixteen.nan? || sixteen.infinite? ? 0 : sixteen.to_i,
      :seventeen => seventeen.nan? || seventeen.infinite? ? 0 : seventeen.to_i,
      :eighteen => eighteen.nan? || eighteen.infinite? ? 0 : eighteen.to_i,
      :nineteen => nineteen.nan? || nineteen.infinite? ? 0 : nineteen.to_i,
      :twenty => twenty.nan? || twenty.infinite? ? 0 : twenty.to_i,
      :twenty_one => twenty_one.nan? || twenty_one.infinite? ? 0 : twenty_one.to_i,
      :twenty_two => twenty_two.nan? || twenty_two.infinite? ? 0 : twenty_two.to_i,
      :twenty_three => twenty_three.nan? || twenty_three.infinite? ? 0 : twenty_three.to_i,
      :total  => total_day.to_f.nan? || total_day.to_f.infinite? ? 0 : total_day.to_i
    }
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
