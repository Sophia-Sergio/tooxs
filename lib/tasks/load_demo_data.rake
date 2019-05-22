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
    populate_categories_sales_plan
    populate_store_department_categories
  end

  def delete_all(excel)
    ActiveRecord::Base.connection.execute("DELETE from categories_store_departments")
    UserShift.delete_all
    CategorySale.delete_all
    CategorySalesPlan.delete_all
    Category.delete_all
    OptimizedProductivity.delete_all
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
    World.delete_all

    (1..4).each { |index| Category.create!(cod: index.to_s, level: 1, parents: []) }

    excel.worksheets.each do |sheet|
      ActiveRecord::Base.connection.reset_pk_sequence!(sheet.sheet_name)
    end
  end

  def proper_class_name(sheet)
    sheet.sheet_name.camelize.singularize.constantize
  end

  def iterate_sheet_rows(class_, sheet)
    keys = []
    puts "populating #{class_.name}"
    sheet.each_with_index do |row, i|
      break if row.nil?

      if i.zero?
        keys = row.cells.map { |c| c&.value&.delete(' ')&.to_sym if c }.compact
        next
      end

      values = row.cells.map(&:value)
      params = keys.zip(values).to_h

      object = class_.create!(params)
      puts '*' * 100
      puts object.inspect
    end
  end

  def populate_categories_sales_plan
    ActiveRecord::Base.connection.reset_pk_sequence!("category_sales_plans")
    excel = load_excel("plan_ventas.xlsx")
    weekly = {}
    daily = {}
    keys = []
    puts 'populating categories_sales_plan'

    excel.worksheets.first.each_with_index do |row, i|
      break if row.nil?

      if i.zero?
        keys = row.cells.map { |c| c&.value&.delete(' ')&.to_sym if c }.compact
        next
      end

      values = row.cells.map(&:value)
      params = keys.zip(values).to_h

      if params[:daily_picked] == 1
        daily[params[:date].to_date] = params[:daily]
      end
      if params[:weekly_picked] == 1
        weekly[params[:week].to_i] = params[:weekly]
      end
      if params[:monthly_picked] == 1
        monthly = params[:monthly].to_i
        year = params[:date].to_date.year
        object = CategorySalesPlan.create!(
          year: year, store_id: 1, category_cod: params[:id],
          month: params[:month], monthly: monthly, daily: daily, weekly: weekly
        )
        weekly = {}
        daily = {}
        puts '*' * 100
        puts object.inspect
      end
    end
  end

  def populate_store_department_categories
    StoreDepartment.all.each_with_index do |store_department, index|
      store_department.categories.delete_all
      store_department.categories << Category.where(cod: index.to_s)
    end
  end
end
