# frozen_string_literal: true

require 'rubyXL'
require 'rake'

namespace :excel do
  task convert: :environment do
    puts '*' * 100
    puts 'Inicia proceso conversión Excel'
    puts '*' * 100
    excel = ExcelConvert.load_excel('turnos_tooxs.xlsx')
    data = ExcelConvert.load_data(excel)
    csv = ExcelConvert.to_csv data

    pp csv
  end
end

class ExcelConvert
  def self.load_excel(file_name)
    RubyXL::Parser.parse "lib/tasks/data/#{file_name}"
  end

  def self.load_data(excel)
    excel.worksheets.map do |sheet|
      class_ = sheet.sheet_name
      self.iterate_sheet_rows(class_, sheet)
    end
  end

  def self.iterate_sheet_rows(class_, sheet)
    keys = {}
    shift_id = 0
    week = 0
    the_week = []
    check_in, check_out, week, mon, twe, wed, thr, fri, sat, sun = Array.new(10)
    sheet.each do |row|
      next if row.cells.nil?

      check_in, check_out, *the_week = row.cells.map{|r| (r.nil?) ? nil : r.value}

      if !check_in.nil? && !check_in.is_a?(DateTime) && check_in.delete(' ').casecmp('TURNO').zero?
        shift_id = check_out
        keys.store(shift_id, {})
        next
      end
      if [check_in, check_out].join.empty?
        week, mon, twe, wed, thr, fri, sat, sun = the_week
        next if week.nil?

        week_data = Hash[
          1, { "day": mon, "check_in": '', "check_out": '' },
          2, { "day": twe, "check_in": '', "check_out": '' },
          3, { "day": wed, "check_in": '', "check_out": '' },
          4, { "day": thr, "check_in": '', "check_out": '' },
          5, { "day": fri, "check_in": '', "check_out": '' },
          6, { "day": sat, "check_in": '', "check_out": '' },
          7, { "day": sun, "check_in": '', "check_out": '' }
        ]
        keys[shift_id].merge! Hash[week, week_data]
        next
      end

      _week, mon, twe, wed, thr, fri, sat, sun = the_week

      next if [mon, twe, wed, thr, fri, sat, sun].join.empty?

      if !mon.nil? && mon.casecmp('X').zero?
        keys[shift_id][week][1][:check_in] = check_in.strftime("%H:%M:%S") if keys[shift_id][week][1][:check_in].empty?
        keys[shift_id][week][1][:check_out] = check_out.strftime("%H:%M:%S") if check_out.is_a?(DateTime)
      end
      if !twe.nil? && twe.casecmp('X').zero?
        keys[shift_id][week][2][:check_in] = check_in.strftime("%H:%M:%S") if keys[shift_id][week][2][:check_in].empty?
        keys[shift_id][week][2][:check_out] = check_out.strftime("%H:%M:%S") if check_out.is_a?(DateTime)
      end
      if !wed.nil? && wed.casecmp('X').zero?
        keys[shift_id][week][3][:check_in] = check_in.strftime("%H:%M:%S") if keys[shift_id][week][3][:check_in].empty?
        keys[shift_id][week][3][:check_out] = check_out.strftime("%H:%M:%S") if check_out.is_a?(DateTime)
      end
      if !thr.nil? && thr.casecmp('X').zero?
        keys[shift_id][week][4][:check_in] = check_in.strftime("%H:%M:%S") if keys[shift_id][week][4][:check_in].empty?
        keys[shift_id][week][4][:check_out] = check_out.strftime("%H:%M:%S") if check_out.is_a?(DateTime)
      end
      if !fri.nil? && fri.casecmp('X').zero?
        keys[shift_id][week][5][:check_in] = check_in.strftime("%H:%M:%S") if keys[shift_id][week][5][:check_in].empty?
        keys[shift_id][week][5][:check_out] = check_out.strftime("%H:%M:%S") if check_out.is_a?(DateTime)
      end
      if !sat.nil? && sat.casecmp('X').zero?
        keys[shift_id][week][6][:check_in] = check_in.strftime("%H:%M:%S") if keys[shift_id][week][6][:check_in].empty?
        keys[shift_id][week][6][:check_out] = check_out.strftime("%H:%M:%S") if check_out.is_a?(DateTime)
      end
      if !sun.nil? && sun.casecmp('X').zero?
        keys[shift_id][week][7][:check_in] = check_in.strftime("%H:%M:%S") if keys[shift_id][week][7][:check_in].empty?
        keys[shift_id][week][7][:check_out] = check_out.strftime("%H:%M:%S") if check_out.is_a?(DateTime)
      end
    end
    keys
  end

  def self.to_csv(data)
    csv = []
    data.each do |shift|
      shift.keys.each do |weeks|
        next if shift[weeks].values.map{ |v| v.keys.map{ |vv| [ v[vv][:check_in], v[vv][:check_out] ] unless v[vv].nil? || v[vv][:check_in].empty? } }.join.empty?

        shift[weeks].keys.each do |wk|
          next if shift[weeks][wk].keys.map{ |wkv| shift[weeks][wk][wkv][:check_in] }.join.empty?

          shift[weeks][wk].keys.each do |wkv|
            next if shift[weeks][wk][wkv][:check_in].empty?

            csv << [
              weeks,
              wk,
              shift[weeks][wk][wkv][:day],
              shift[weeks][wk][wkv][:check_in],
              shift[weeks][wk][wkv][:check_out]
            ]
          end
        end
      end
    end
    csv
  end
end
