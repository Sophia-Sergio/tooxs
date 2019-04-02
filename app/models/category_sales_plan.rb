class CategorySalesPlan < ApplicationRecord
  extend CommercialCalendar::Period

  belongs_to :store
  belongs_to :category, foreign_key: 'category_cod'

  scope :by_store_month, ->(store_id, opts = {}) {
    where(store_id: store_id, year: opts[:year], month: opts[:month])
  }
  scope :between, ->(period, store_id) {
    start_month = month_by_date(period[:start])
    end_month   = month_by_date(period[:end])
    start_year  = year_by_date(period[:start])
    end_year    = year_by_date(period[:end])
    if start_year == end_year
      where('year = ? AND month >= ? AND month <= ? AND category_sales_plans.store_id = ?',
        start_year, start_month, end_month, store_id).order('category_sales_plans.year, category_sales_plans.month')
    else
      where('year = ? AND month >= ? AND category_sales_plans.store_id = ?',
        start_year, start_month, store_id).or(where('year = ? AND month <= ? AND category_sales_plans.store_id = ?',
        end_year, end_month, store_id)).order('category_sales_plans.year, category_sales_plans.month')
    end
  }
end
