class AvailableShift < ApplicationRecord
  require 'chronic'

  belongs_to :store
  validates_presence_of :num, :name, :month, :week, :day

  scope :code, ->(value) { where(num: value) if value }

  def shift
    cols = ['nine','ten','eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen','twenty','twenty_one','twenty_two','twenty_three','twenty_four']
    current = false

    cols.each_with_index do |c,i|

      if self.public_send(cols[i]) == true
        if current == false
          @start = cols[i]
        end
          current = true
      else

        if current == true
          @end = cols[i-1]
          break
        end

      end
    end
    @start  = "#{NumbersInWords.in_numbers(@start)}:00"
    @end    = "#{NumbersInWords.in_numbers(@end)}:00"

    shift = [@start,@end]
  end

  def date_shift

    month = self.month
    week  = self.week_of_year
    day   = self.day

    month_text  = Date::MONTHNAMES[month.to_i]
    week_text   = week.ordinalize
    day_text    = Date::DAYNAMES[day.to_i]


    @date = Chronic.parse("#{week_text} #{day_text} in #{month_text}")
    if !@date.nil?
      @date.strftime("%F")
    end

    return @date
  end

  def date_time_shift
    @newdate   = self.date_shift
    @start  = self.shift.first
    @end    = self.shift.last

    date_time_start = (@date.to_s + " " +@start.to_s).to_datetime
    date_time_end = (@date.to_s + " " +@end.to_s).to_datetime

    return [date_time_start.strftime("%FT%R"), date_time_end.strftime("%FT%R")]
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

      av_shift = AvailableShift.find_or_initialize_by(
        store_id: store.id,
        num: row[1],
        name: row[2],
        month: row[3],
        week: row[4],
        day: row[5]
      )

      av_shift.update_attributes(
        nine: ['true', 'true'].include?(row[6]) ? true : false,
        ten: ['true', 'true'].include?(row[7]) ? true : false,
        eleven: ['true', 'true'].include?(row[8]) ? true : false,
        twelve: ['true', 'true'].include?(row[9]) ? true : false,
        thirteen: ['true', 'true'].include?(row[10]) ? true : false,
        fourteen: ['true', 'true'].include?(row[11]) ? true : false,
        fifteen: ['true', 'true'].include?(row[12]) ? true : false,
        sixteen: ['true', 'true'].include?(row[13]) ? true : false,
        seventeen: ['true', 'true'].include?(row[14]) ? true : false,
        eighteen: ['true', 'true'].include?(row[15]) ? true : false,
        nineteen: ['true', 'true'].include?(row[16]) ? true : false,
        twenty: ['true', 'true'].include?(row[17]) ? true : false,
        twenty_one: ['true', 'true'].include?(row[18]) ? true : false,
        twenty_two: ['true', 'true'].include?(row[19]) ? true : false,
        twenty_three: ['true', 'true'].include?(row[20]) ? true : false,
        twenty_four: ['true', 'true'].include?(row[21]) ? true : false
      )
    end
  end
end
