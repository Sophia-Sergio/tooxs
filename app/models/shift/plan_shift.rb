class PlanShift < ApplicationRecord
  belongs_to :work_shift

  scope :find_case, ->(opts) { find_by(opts.slice(:week, :day)) }
  # extend Hours
  # validates_presence_of :week, :day

  # scope :code, ->(value) { where(num: value) if value }
  # scope :by_week, ->(week) { where(week: week) }
  # scope :by_day, ->(day) { where(day: day) }
  # scope :by_month, ->(month) { where(month: month) }

  # def end_hour
  #   Hours::HOURS.reverse_each { |hour| return word_to_number(hour) if send(hour.to_sym)}
  #   0
  # end

  # def shift
  #   [start_hour.to_i, end_hour.to_i + 1]
  # end

  # def start_hour
  #   Hours::HOURS.each { |hour| return word_to_number(hour) if send(hour.to_sym) }
  #   0
  # end

  # def date_shift
  #   text = "#{Date::MONTHNAMES[month.to_i - 1]}
  #           #{Date::DAYNAMES[day.to_i - 1]}
  #           in #{week.ordinalize}"
  #   Chronic.parse(text)
  # end

  # def date_time_shift
  #   @newdate   = self.date_shift
  #   @start  = self.shift.first
  #   @end    = self.shift.last

  #   date_time_start = (@date.to_s + " " +@start.to_s).to_datetime
  #   date_time_end = (@date.to_s + " " +@end.to_s).to_datetime

  #   return [date_time_start.strftime("%FT%R"), date_time_end.strftime("%FT%R")]
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

  # private

  # def word_to_number(shift_hour)
  #   "#{NumbersInWords.in_numbers(shift_hour)}:00"
  # end

  # def import_row(row)
  #   store = Store.find_by_origin_id(row[0])
  #   return if store.nil?

  #   av_shift = AvailableShift.find_or_initialize_by(
  #     store_id: store.id,
  #     num: row[1],
  #     name: row[2],
  #     month: row[3],
  #     week: row[4],
  #     day: row[5]
  #   )

  #   av_shift.update_attributes(
  #     nine: ['true', 'true'].include?(row[6]) ? true : false,
  #     ten: ['true', 'true'].include?(row[7]) ? true : false,
  #     eleven: ['true', 'true'].include?(row[8]) ? true : false,
  #     twelve: ['true', 'true'].include?(row[9]) ? true : false,
  #     thirteen: ['true', 'true'].include?(row[10]) ? true : false,
  #     fourteen: ['true', 'true'].include?(row[11]) ? true : false,
  #     fifteen: ['true', 'true'].include?(row[12]) ? true : false,
  #     sixteen: ['true', 'true'].include?(row[13]) ? true : false,
  #     seventeen: ['true', 'true'].include?(row[14]) ? true : false,
  #     eighteen: ['true', 'true'].include?(row[15]) ? true : false,
  #     nineteen: ['true', 'true'].include?(row[16]) ? true : false,
  #     twenty: ['true', 'true'].include?(row[17]) ? true : false,
  #     twenty_one: ['true', 'true'].include?(row[18]) ? true : false,
  #     twenty_two: ['true', 'true'].include?(row[19]) ? true : false,
  #     twenty_three: ['true', 'true'].include?(row[20]) ? true : false,
  #     twenty_four: ['true', 'true'].include?(row[21]) ? true : false
  #   )
  # end
end
