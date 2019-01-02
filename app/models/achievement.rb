class Achievement < ApplicationRecord
  extend Hours
  belongs_to :store_department
  belongs_to :store
  belongs_to :user

  scope :between, ->(start_date, end_date) { where('date between ? AND ?', start_date, end_date) }
  scope :by_date, ->(date) { where(date: date) }

  def total_day
    achievement.values.map(&:to_f).sum.round(2)
  end

  def self.total
    select(:achievement).inject(0) { |result, achievement| result + achievement.total_day }.round
  end

  def self.sum_by_hour
    array = []
    all.each do |achievement|
      values = achievement.achievement.values.map(&:to_i)
      array = array.any? ? array.zip(values).map { |a| a.inject(:+) } : values
    end
    Settings.periods_keys.zip(array).to_h
  end

  def self.productivity_by_hour(start_date, end_date)
    (start_date.to_date..end_date.to_date).each_with_object({}) do |date, hash|
      workers = User.working_on_date(date).workers_by_hour
      achievements = Achievement.by_date(date).sum_by_hour
      productivity = achievements.keys.map { |hour| (achievements[hour] / workers[hour].to_f).round(2) }
      hash[date] = achievements.keys.zip(productivity).to_h
    end
  end

  def self.productivity_rate(start_date, end_date)
    productivities = productivity_by_hour(start_date, end_date)
    productivities.each_with_object({}) do |productivity, hash|
      target_productivity = TargetProductivity.by_date(productivity[0])
      productivity_rates = productivity[1].values.map do |amount|
        (amount / target_productivity.to_f).round(2)
      end
      hash[productivity[0]] = productivity[1].keys.zip(productivity_rates).to_h
    end
  end

  # scope :by_year, ->(year) { where(year: year) }

  # def self.number_of_sales_by_hour
  #   Hours::HOURS.each_with_object({}) do |hour, hash|
  #     shift = group(:week, :day_number).order('real_sales.week, real_sales.day_number').sum(hour.to_sym)
  #     hash[hour.to_sym] = shift
  #   end
  # end

  # def to_hour
  #   # busco la venta por hora del año anterior
  #   historic_sale = RealSale.where(year: year-1, week: week, month: month).first

  #   nine          = (historic_sale[:nine].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
  #   ten           = (historic_sale.ten.to_f / historic_sale.total_day.to_f ) * total_day.to_f
  #   eleven        = (historic_sale[:eleven].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
  #   twelve        = (historic_sale[:twelve].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
  #   thirteen      = (historic_sale[:thirteen].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
  #   fourteen      = (historic_sale[:fourteen].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
  #   fifteen       = (historic_sale[:fifteen].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
  #   sixteen       = (historic_sale[:sixteen].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
  #   seventeen     = (historic_sale[:seventeen].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
  #   eighteen      = (historic_sale[:eighteen].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
  #   nineteen      = (historic_sale[:nineteen].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
  #   twenty        = (historic_sale[:twenty].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
  #   twenty_one    = (historic_sale[:twenty_one].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
  #   twenty_two    = (historic_sale[:twenty_two].to_f / historic_sale[:total_day].to_f ) * total_day.to_f
  #   twenty_three  = (historic_sale[:twenty_three].to_f / historic_sale[:total_day].to_f ) * total_day.to_f

  #   hourly = {
  #     :nine => nine.nan? || nine.infinite? ? 0 : nine.to_i,
  #     :ten => ten.nan? || ten.infinite? ? 0 : ten.to_i,
  #     :eleven => eleven.nan? || eleven.infinite? ? 0 : eleven.to_i,
  #     :twelve => twelve.nan? || twelve.infinite? ? 0 : twelve.to_i,
  #     :thirteen => thirteen.nan? || thirteen.infinite? ? 0 : thirteen.to_i,
  #     :fourteen => fourteen.nan? || fourteen.infinite? ? 0 : fourteen.to_i,
  #     :fifteen => fifteen.nan? || fifteen.infinite? ? 0 : fifteen.to_i,
  #     :sixteen => sixteen.nan? || sixteen.infinite? ? 0 : sixteen.to_i,
  #     :seventeen => seventeen.nan? || seventeen.infinite? ? 0 : seventeen.to_i,
  #     :eighteen => eighteen.nan? || eighteen.infinite? ? 0 : eighteen.to_i,
  #     :nineteen => nineteen.nan? || nineteen.infinite? ? 0 : nineteen.to_i,
  #     :twenty => twenty.nan? || twenty.infinite? ? 0 : twenty.to_i,
  #     :twenty_one => twenty_one.nan? || twenty_one.infinite? ? 0 : twenty_one.to_i,
  #     :twenty_two => twenty_two.nan? || twenty_two.infinite? ? 0 : twenty_two.to_i,
  #     :twenty_three => twenty_three.nan? || twenty_three.infinite? ? 0 : twenty_three.to_i,
  #     :total  => total_day.to_f.nan? || total_day.to_f.infinite? ? 0 : total_day.to_i
  #   }
  # end

  # def week_of_year
  #   sale_date.strftime('%V').to_i
  # end

  # def month
  #   sale_date.strftime("%B").to_s
  # end

  # def day
  #   sale_date.strftime("%A").to_s
  # end

  # def total_day
  #   nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four
  # end

  # def self.from_xlsx(file = '')
  #   return if file.blank?
  #   worksheet = RubyXL::Parser.parse(file)[0]

  #   worksheet.each_with_index do |row, i|
  #     next if i.zero?
  #     values = []
  #     row && row.cells.each do |cell|
  #       val = cell && cell.value
  #       values << val
  #     end
  #     import_row(values)
  #   end
  # end

  # def self.total_sales(department, month, year = Date.today.year)
  #   sales_by_day(department, month, year).sum
  # end

  # def self.sales_by_day(month, year = Date.today.year)
  #   sales = by_month(month).by_year(year)
  #   sales.each_with_object([]) { |sale, array| array << sale.total_day }
  # end

  # private

  # def self.productivity_by_day(staff_by_day)
  #   hash = each_with_object({}) do |sale, hash|
  #     (hash[:real_productivity] ||= []) << (sale.total_day.to_f / staff_by_day[@contReal]).round(2)
  #     @contReal += 1
  #   end
  # end

  # def parse_integer(dec_num)
  #   return 0 if dec_num == '-'
  #   dec_num.to_s.delete('.').to_i
  # end

  # def import_row(row)
  #   store = Store.find(row[0])
  #   return if store.nil?

  #   sale_real = RealSale.find_or_initialize_by(
  #     store_id: store.id,
  #     department_id: row[1],
  #     sale_date: row[2]
  #   )

  #   sale_real.update_attributes(
  #     nine: parse_integer(row[3]),
  #     ten: parse_integer(row[4]),
  #     eleven: parse_integer(row[5]),
  #     twelve: parse_integer(row[6]),
  #     thirteen: parse_integer(row[7]),
  #     fourteen: parse_integer(row[8]),
  #     fifteen: parse_integer(row[9]),
  #     sixteen: parse_integer(row[10]),
  #     seventeen: parse_integer(row[11]),
  #     eighteen: parse_integer(row[12]),
  #     nineteen: parse_integer(row[13]),
  #     twenty: parse_integer(row[14]),
  #     twenty_one: parse_integer(row[15]),
  #     twenty_two: parse_integer(row[16]),
  #     twenty_three: parse_integer(row[17]),
  #     twenty_four: parse_integer(row[18]),
  #     week: parse_integer(row[19]),
  #     month: parse_integer(row[20]),
  #     year: parse_integer(row[21]),
  #     day_number: parse_integer(row[22])
  #   )
  # end
end