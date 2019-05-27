# frozen_string_literal: true

require 'rubyXL'
require 'rake'

namespace :excel do
  task convert: :environment do
    puts '*' * 100
    puts 'Inicia proceso conversión Excel'
    puts '*' * 100
    excel = ExcelConvert.load_excel('universo.xlsx')
    data = ExcelConvert.load_data(excel)
    matrix_data = ExcelConvert.to_matrix data

    puts 'Inicia exportación a Excel'
    puts '*' * 50
    headers = ['Turno', 'Semana', 'Dia', 'Check In', 'Check Out']
    ExcelConvert.write_excel('export_universo.xlsx', headers, matrix_data)
    puts 'Término proceso conversión Excel'

    # puts '*' * 50
    # puts 'Inicia exportación a JSON Motor'
    # puts '*' * 50
    # json_action = 'ejecutar'
    # id_process = 25006
    # ExcelConvert.write_json('api_mot.json', json_action, id_process, matrix_data)
    # puts 'Término proceso conversión JSON Motor'

    puts '*' * 100
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
    puts '*' * 50
    puts "Procesando Hoja: #{class_}"
    puts '*' * 50
    keys = {}
    shift_id = 0
    week = 0
    the_week = []
    check_in, check_out, week, mon, twe, wed, thr, fri, sat, sun = Array.new(10)
    sheet.each do |row|
      next if row.nil? || row.cells.nil?

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
          1, { "day": mon, "check_in": '00:00:00', "check_out": '00:00:00' },
          2, { "day": twe, "check_in": '00:00:00', "check_out": '00:00:00' },
          3, { "day": wed, "check_in": '00:00:00', "check_out": '00:00:00' },
          4, { "day": thr, "check_in": '00:00:00', "check_out": '00:00:00' },
          5, { "day": fri, "check_in": '00:00:00', "check_out": '00:00:00' },
          6, { "day": sat, "check_in": '00:00:00', "check_out": '00:00:00' },
          7, { "day": sun, "check_in": '00:00:00', "check_out": '00:00:00' }
        ]
        keys[shift_id].merge! Hash[week, week_data]
        next
      end

      _week, mon, twe, wed, thr, fri, sat, sun = the_week

      next if [mon, twe, wed, thr, fri, sat, sun].join.empty?

      if !mon.nil? && mon.casecmp('X').zero?
        keys[shift_id][week][1][:check_in] = check_in.strftime("%H:%M:%S") if keys[shift_id][week][1][:check_in].casecmp('00:00:00').zero?
        keys[shift_id][week][1][:check_out] = check_out.strftime("%H:%M:%S") if check_out.is_a?(DateTime)
      end
      if !twe.nil? && twe.casecmp('X').zero?
        keys[shift_id][week][2][:check_in] = check_in.strftime("%H:%M:%S") if keys[shift_id][week][2][:check_in].casecmp('00:00:00').zero?
        keys[shift_id][week][2][:check_out] = check_out.strftime("%H:%M:%S") if check_out.is_a?(DateTime)
      end
      if !wed.nil? && wed.casecmp('X').zero?
        keys[shift_id][week][3][:check_in] = check_in.strftime("%H:%M:%S") if keys[shift_id][week][3][:check_in].casecmp('00:00:00').zero?
        keys[shift_id][week][3][:check_out] = check_out.strftime("%H:%M:%S") if check_out.is_a?(DateTime)
      end
      if !thr.nil? && thr.casecmp('X').zero?
        keys[shift_id][week][4][:check_in] = check_in.strftime("%H:%M:%S") if keys[shift_id][week][4][:check_in].casecmp('00:00:00').zero?
        keys[shift_id][week][4][:check_out] = check_out.strftime("%H:%M:%S") if check_out.is_a?(DateTime)
      end
      if !fri.nil? && fri.casecmp('X').zero?
        keys[shift_id][week][5][:check_in] = check_in.strftime("%H:%M:%S") if keys[shift_id][week][5][:check_in].casecmp('00:00:00').zero?
        keys[shift_id][week][5][:check_out] = check_out.strftime("%H:%M:%S") if check_out.is_a?(DateTime)
      end
      if !sat.nil? && sat.casecmp('X').zero?
        keys[shift_id][week][6][:check_in] = check_in.strftime("%H:%M:%S") if keys[shift_id][week][6][:check_in].casecmp('00:00:00').zero?
        keys[shift_id][week][6][:check_out] = check_out.strftime("%H:%M:%S") if check_out.is_a?(DateTime)
      end
      if !sun.nil? && sun.casecmp('X').zero?
        keys[shift_id][week][7][:check_in] = check_in.strftime("%H:%M:%S") if keys[shift_id][week][7][:check_in].casecmp('00:00:00').zero?
        keys[shift_id][week][7][:check_out] = check_out.strftime("%H:%M:%S") if check_out.is_a?(DateTime)
      end
    end
    keys
  end

  def self.to_matrix(data)
    matrix = []
    data.each do |shift|
      shift.keys.each do |weeks|
        next if shift[weeks].values.map{ |v| v.keys.map{ |vv| [ v[vv][:check_in], v[vv][:check_out] ] unless v[vv].nil? || v[vv][:check_in].empty? } }.join.empty?

        shift[weeks].keys.each do |wk|
          next if shift[weeks][wk].keys.map{ |wkv| shift[weeks][wk][wkv][:check_in] }.join.empty?

          shift[weeks][wk].keys.each do |wkv|
            next if shift[weeks][wk][wkv][:check_in].empty?
            matrix << [
              weeks,
              wk,
              wkv,
              shift[weeks][wk][wkv][:check_in],
              shift[weeks][wk][wkv][:check_out]
            ]
          end
        end
      end
    end
    matrix
  end

  def self.write_excel(file_name, headers, data)
    workbook = RubyXL::Workbook.new
    worksheet = workbook[0]
    worksheet.sheet_name = 'Turnos TOOXS'
    headers.each_with_index { |h, i| worksheet.add_cell(0, i, h) }
    data.each_with_index { |row, r_i| row.each_with_index { |d, i| worksheet.add_cell(r_i + 1, i, d) } }

    workbook.write("lib/tasks/data/#{file_name}")
  end

  def self.write_json(file_name, headers, data)
    json_action, id_process = headers
    matrix_base = {
      "accion": json_action,
      "id_caso": id_process,
      "datos": {
        "valor_hp": 0,
        "Entrada_Almuerzo": "[1] 1, [2] 1, [3] 1, [4] 1, [5] 1, [6] 1",
        "num_dias_ventana": 35,
        "matriz_turnos": "",
        "min_horas": 4,
        "num_turnos": 104,
        "num_ventanas": 1,
        "combinar_turnos": 0,
        "prod_obj": 81.4,
        "mostrar_plan_venta": 1,
        "Horas_Almuerzo": "[9] 1, [10] 1, [11] 1, [12] 1, [13] 1, [14] 1, [15] 1, [16] 1, [17] 1",
        "dotacion_real": "[1,1,1] 1, [2,1,1] 1, [3,1,1] 1, [4,1,1] 1, [7,1,1] 1, [8,1,1] 1, [10,1,1] 1, [11,1,1] 1",
        "POV": "",
        "num_horas_dia": 28,
        "horario_almuerzo": 1,
        "num_turnos_combinables": 0,
        "num_departamentos": 1,
        "plan_venta": "",
        "mostrar_turnos": 1,
        "VHP": ""
      },
      "tiempo_maximo": 15,
      "evaluar_dotacion_real": 1,
      "usuario": "fperez@tooxs.com",
      "tolerancia": 3.0
    }

    data.each_with_index { |row, r_i| row.each_with_index { |d, i| worksheet.add_cell(r_i + 1, i, d) } }

    workbook.write("lib/tasks/data/#{file_name}")
  end
end
