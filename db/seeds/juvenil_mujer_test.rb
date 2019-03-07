include CommercialCalendar::Period

Store.find(13).departments.each do |department|
  categories = StoreDepartment.find_by(store_id: 13, department: department).categories
  weeks_factors = [
    [0.1260080645, 0.1272681452, 0.1323084677, 0.1335685484, 0.1512096774, 0.1663306452, 0.1633064516],
    [0.1211849136, 0.1325413713, 0.1338031482, 0.137063898, 0.1500694142, 0.1632623005, 0.1620749542],
    [0.1210918046, 0.1206378981, 0.1337002915, 0.1342464461, 0.1558928436, 0.1679824583, 0.1664482579],
    [0.1254298282, 0.1268960623, 0.1325598853, 0.1334997166, 0.1513142937, 0.1666728849, 0.1636273289]
  ]
  categories.each do |category|
    (2017..2019).each do |year|
      (1..12).each do |month|
        (1..Settings.weeks_by_month[month]).each do |week|
          period = week_period(year, month, week)
          week_sales = category.sales.between(period).sum(:amount)
          category.sales.between(period).order(:date).each do |sale|
            next if sale.updated_at > (Date.today - 1.day)

            factor = weeks_factors.sample[day_number(sale.date) - 1]
            amount = (week_sales * factor).to_i * rand(rand(0.65..0.85)..rand(1.15..1.45))
            hourly = Settings.productivity_periods_keys.each_with_object({}) do |key, hash|
              hash[key] = (amount / Settings.productivity_periods_keys.count).round.to_i
            end
            sale.amount = amount
            sale.hourly = hourly
            sale.save!
          end
        end
      end
    end
  end
end

Store.find(13).departments.each do |department|
  categories = StoreDepartment.find_by(store_id: 13, department: department).categories
  weeks_factors = [
    [0.1260080645, 0.1272681452, 0.1323084677, 0.1335685484, 0.1512096774, 0.1663306452, 0.1633064516],
    [0.1211849136, 0.1325413713, 0.1338031482, 0.137063898, 0.1500694142, 0.1632623005, 0.1620749542],
    [0.1210918046, 0.1206378981, 0.1337002915, 0.1342464461, 0.1558928436, 0.1679824583, 0.1664482579],
    [0.1254298282, 0.1268960623, 0.1325598853, 0.1334997166, 0.1513142937, 0.1666728849, 0.1636273289]
  ]
  categories.each do |category|
    (2017..2019).each do |year|
      (1..12).each do |month|
        category.sales_plans.where(year: year, month: month).each do |sales_plan|
          daily = sales_plan.daily.each_with_object({}) do |(day, value), hash|
            factor = weeks_factors.sample[day_number(day.to_date) - 1]
            hash[day.to_date] = (value.to_i * 7) * factor
          end
          sales_plan.daily = daily
          sales_plan.save!
        end
      end
    end
  end
end

categories = StoreDepartment.find_by(store_id: 13, department_id: 3).categories
weeks_factors = [
  [0.1260080645, 0.1272681452, 0.1323084677, 0.1335685484, 0.1512096774, 0.1663306452, 0.1633064516],
  [0.1211849136, 0.1325413713, 0.1338031482, 0.137063898, 0.1500694142, 0.1632623005, 0.1620749542],
  [0.1210918046, 0.1206378981, 0.1337002915, 0.1342464461, 0.1558928436, 0.1679824583, 0.1664482579],
  [0.1254298282, 0.1268960623, 0.1325598853, 0.1334997166, 0.1513142937, 0.1666728849, 0.1636273289]
]
categories.each do |category|
  (2017..2019).each do |year|
    (1..12).each do |month|
      category.sales_plans.where(year: year, month: month).each do |sales_plan|
        daily = sales_plan.daily.each_with_object({}) do |(day, value), hash|
          hash[day] = value.to_i * rand(3.45..3.67)
        end
        sales_plan.daily = daily
        sales_plan.save!
      end
    end
  end
end

categories = StoreDepartment.find_by(store_id: 13, department_id: 9).categories
weeks_factors = [
  [0.1260080645, 0.1272681452, 0.1323084677, 0.1335685484, 0.1512096774, 0.1663306452, 0.1633064516],
  [0.1211849136, 0.1325413713, 0.1338031482, 0.137063898, 0.1500694142, 0.1632623005, 0.1620749542],
  [0.1210918046, 0.1206378981, 0.1337002915, 0.1342464461, 0.1558928436, 0.1679824583, 0.1664482579],
  [0.1254298282, 0.1268960623, 0.1325598853, 0.1334997166, 0.1513142937, 0.1666728849, 0.1636273289]
]
categories.each do |category|
  (2017..2019).each do |year|
    (1..12).each do |month|
      category.sales_plans.where(year: year, month: month).each do |sales_plan|
        daily = sales_plan.daily.each_with_object({}) do |(day, value), hash|
          hash[day] = value.to_i * rand(3.45..3.67)
        end
        sales_plan.daily = daily
        sales_plan.save!
      end
    end
  end
end
