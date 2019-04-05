include CommercialCalendar::Period
avg_productivities_weeks = [
  {
    1 => 86044,
    2 => 87672,
    3 => 76965,
    4 => 71240,
    5 => 84715,
    6 => 98327,
    7 => 114131
  },
  {
    1 => 77959,
    2 => 72758,
    3 => 106706,
    4 => 82636,
    5 => 87554,
    6 => 75121,
    7 => 98340
  },
  {
    1 => 82392,
    2 => 94337,
    3 => 73434,
    4 => 86716,
    5 => 100530,
    6 => 77468,
    7 => 84861
  },
  {
    1 => 81235,
    2 => 92634,
    3 => 78563,
    4 => 92733,
    5 => 88620,
    6 => 75061,
    7 => 98262
  }
]

# OptimizedProductivity.delete_all
Store.all.each do |store|
  store.departments.each do |department|
    store_department = StoreDepartment.find_by(store: store, department: department)
    ('2017-01-02'.to_date..'2019-12-29'.to_date).each do |date|
      avg_productivities = avg_productivities_weeks.sample
      hourly = Settings.productivity_periods_keys.each_with_object({}) do |key, hash|
        hash[key] = avg_productivities[day_number(date)]
      end
      OptimizedProductivity.create!(store_department: store_department, date: date, hourly: hourly)
    end
  end
end

puts 'optimized productivities loaded'
