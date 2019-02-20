categories = CategorySale.all.pluck(:category_cod)
CategorySale.where(category_cod:"j090206").delete_all
CategorySalesPlan.where(category_cod:"j090206").delete_all

CategorySale.where(category_cod:categories).delete_all
CategorySalesPlan.where(category_cod:categories).delete_all
store = Store.find_by(name: Settings::STORE_ALLOWED)
categories = Category.where(cod: StoreDepartment.where(store: store).joins(:categories).pluck(:category_cod).uniq)

SALES_2017_BY_MONTH = {
  1 => 7.13,
  2 => 7.52,
  3 => 6.89,
  4 => 8.0,
  5 => 7.92,
  6 => 7.44,
  7 => 8.39,
  8 => 7.6,
  9 => 6.89,
  10 => 7.68,
  11 => 8.0,
  12 => 16.55
}

SALES_JUNE = Settings::DEMO_DEPARTMENTS['Accesorios Mujer']['sales_june_2017']
SALES_RATE_JUNE = Settings::DEMO_DEPARTMENTS['Accesorios Mujer']['sales_rate']
STORE_TOTAL_JUNE = SALES_JUNE / (SALES_RATE_JUNE / 100)
STORE_TOTAL_YEAR = STORE_TOTAL_JUNE / (SALES_2017_BY_MONTH[7] / 100)
STORE_TOTAL_BY_MONTH = SALES_2017_BY_MONTH.each_with_object({}) do |(k,v), hash|
  hash[k] = STORE_TOTAL_YEAR * ( v / 100)
end

categories.each do |category|
  date = Date.new(2017, 1, 2)
  department = category.store_departments.find_by(store:store).department.name
  next if department == "Benefit" || department == "Benetton"
  sales_rate = Settings::DEMO_DEPARTMENTS[department]['sales_rate'] / 100
  categories_count = Settings::DEMO_DEPARTMENTS[department]['categories'].count
  (2017..2019).each do |year|
    (1..12).each do |month|
      next if date > Date.new(2019, 3, 1)

      department_sale = sales_rate * STORE_TOTAL_BY_MONTH[month]
      weeks = Settings.weeks_by_month[month]
      sale_day = department_sale / categories_count / (weeks * 7)
      sale_day += sale_day * rand(-0.07..0.03) if year != 2017
      (1..weeks).each do
        (1..7).each do
          hourly = Settings.productivity_periods_keys.each_with_object({}) do |key, hash|
            hash[key] = (sale_day / Settings.productivity_periods_keys.count).round.to_i
          end
          CategorySale.create!(date:date, store: store, category: category, amount: sale_day, hourly: hourly)
          date += 1
        end
      end
    end
  end
end

puts 'category_sales loaded'

categories.each do |category|
  (2017..2019).each do |year|
    (1..12).each do |month|

      month_period = Settings.month_period(year, month)
      weeks = Settings.weeks_by_month[month]
      total_category_sales = CategorySale.where(category: category).
        between(month_period).total

      sales_plan = CategorySalesPlan.new(store: store, category: category, year: year, month: month, monthly: total_category_sales * rand(1.01..1.33)  )
      sales_plan.weekly = (1..weeks).each_with_object({}) do |week, hash|
        hash[week] = (sales_plan.monthly / weeks).round
      end
      sales_plan.daily = (month_period[:start]..month_period[:end]).each_with_object({}) do |date, hash|
        hash[date] = (sales_plan.monthly / (weeks * 7)).round
      end
      sales_plan.save!
    end
  end
end

puts 'category_sales_plans loaded'