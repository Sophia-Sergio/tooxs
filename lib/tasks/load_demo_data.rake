# frozen_string_literal: true

require 'rubyXL'
require 'rake'

namespace :db do
  namespace :load_excel do
    desc 'Charge Sale Reals'
    task sale_reals: :environment do
      SaleReal.delete_all
      puts SaleReal.count
      excel = load_excel('ventas_reales_al_20_10_18.xlsx')
      excel.worksheets.each do |sheet|
        break if sheet.sheet_name != 'sale_real'

        keys = {}
        sheet.each_with_index do |row, i|
          keys = row.cells.map { |c| c.value.delete(' ').to_sym } if i.zero?
          next if i.zero?

          values = row.cells.map(&:value)
          params = keys.zip(values).to_h
          SaleReal.create!(params)
        end
      end
      print SaleReal.count
    end

    def load_excel(file_name)
      RubyXL::Parser.parse "lib/tasks/data/#{file_name}"
    end
  end
end
