# frozen_string_literal: true

require 'rubyXL'
require 'rake'

namespace :db do
  namespace :load_excel do
    task all: %w[real_sales plan_sales sale_by_seller]

    task real_sales: :environment do
      excel = load_excel('sale_reals.xlsx')
      load_data('SaleReal', excel)
    end
    task plan_sales: :environment do
      excel = load_excel('sale_plans.xlsx')
      load_data('SalePlan', excel)
    end
    task sale_by_seller: :environment do
      excel = load_excel('sale_by_seller.xlsx')
      load_data('SaleBySeller', excel)
    end
    def load_excel(file_name)
      RubyXL::Parser.parse "lib/tasks/data/#{file_name}"
    end
    def load_data(class_name, excel)
      class_ = class_name.constantize
      class_.delete_all
      excel.worksheets.each do |sheet|
        break if sheet.sheet_name != class_name

        keys = {}
        sheet.each_with_index do |row, i|
          keys = row.cells.map { |c| c.value.delete(' ').to_sym } if i.zero?
          next if i.zero?

          values = row.cells.map(&:value)
          params = keys.zip(values).to_h
          class_.create!(params)
        end
      end
    end
  end
end
