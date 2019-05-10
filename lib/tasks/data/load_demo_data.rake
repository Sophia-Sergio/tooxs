# frozen_string_literal: true

require 'rubyXL'
require 'rake'

namespace :db do
  task load_excel: :environment do
    binding.pry
    excel = load_excel('db_tooxs.xlsx')
    load_data(excel)
  end

  def load_excel(file_name)
    RubyXL::Parser.parse "lib/tasks/data/#{file_name}"
  end

  def load_data(excel)
    excel.worksheets.each do |sheet|
      class_ = sheet.sheet_name.constantize
      class_.delete_all
      iterate_sheet_rows(class_, sheet)
    end
  end

  def iterate_sheet_rows(class_, sheet)
    keys = {}
    sheet.each_with_index do |row, i|
      keys = row.cells.map { |c| c&.value&.delete(' ')&.to_sym if c }.compact if i.zero?
      next if i.zero?

      values = row.cells.map(&:value)
      params = keys.zip(values).to_h
      class_.create!(params)
    end
  end
end
