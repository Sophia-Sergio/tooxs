# frozen_string_literal: true

require 'rubyXL'
require 'rake'

namespace :db do
  task load: :environment do
    puts 'start loading excel'
    excel = load_excel('db_tooxs.xlsx')
    puts 'populating....'
    load_data(excel)
  end

  def load_excel(file_name)
    RubyXL::Parser.parse "lib/tasks/data/#{file_name}"
  end

  def load_data(excel)
    delete_all(excel)

    excel.worksheets.each do |sheet|
      class_ = proper_class_name(sheet)
      iterate_sheet_rows(class_, sheet)
    end
  end

  def delete_all(excel)
    ActiveRecord::Base.connection.execute("DELETE from categories_store_departments")
    UserShift.delete_all
    CategorySale.delete_all
    Category.delete_all
    TargetProductivity.delete_all
    TargetSale.delete_all
    UserShift.delete_all
    WorkedShift.delete_all
    Achievement.delete_all
    User.delete_all
    StoreDepartment.delete_all
    Store.delete_all
    Cluster.delete_all
    Department.delete_all
    PlanShift.delete_all
    WorkShift.delete_all

    excel.worksheets.each do |sheet|
      ActiveRecord::Base.connection.reset_pk_sequence!(sheet.sheet_name)
    end
  end

  def proper_class_name(sheet)
    sheet.sheet_name.camelize.singularize.constantize
  end

  def iterate_sheet_rows(class_, sheet)
    keys = {}
    puts "populating #{class_.name}"

    sheet.each_with_index do |row, i|
      keys = row.cells.map { |c| c&.value&.delete(' ')&.to_sym if c }.compact if i.zero?
      next if i.zero?

      values = row.cells.map(&:value)
      params = keys.zip(values).to_h
      object = class_.create!(params)
      puts '*' * 100
      puts object.inspect
    end
  end
end
