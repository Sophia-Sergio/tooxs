COMMUNES = ["Providencia", "Maipu", "Cerro Navia", "Temuco", "Vitacura", "Puente Alto", "Macul", "San Pedro de la Paz", "La Reina", "La Florida"]

require "i18n"

def create_employees(store_department, role)
  name = Faker::Name.first_name.gsub(' ', '.')
  surname_1 = Faker::Name.last_name.gsub(' ', '.')
  email = "#{I18n.transliterate(name)}.#{I18n.transliterate(surname_1)}@falabella.com"
  phone = "+56 9 #{rand(10000000..99999999)}"
  seller = User.create!(name: name, surname_1: surname_1, email: email,
                password: 123456, phone: phone, address: Faker::Address.full_address,
                commune: COMMUNES.sample, store_department: store_department, store: store_department.store)
  seller.save!
  seller.add_role role.to_sym
rescue
  binding.pry
end

STORES.each do |store|
  store.store_departments.where(department: DEPARTMENTS).each do |store_department|
    Settings::DEMO_DEPARTMENTS[store_department.department.name]['employees']['sellers'].times do
      create_employees(store_department, 'seller')
    end
    Settings::DEMO_DEPARTMENTS[store_department.department.name]['employees']['sales_assistants'].times do
      create_employees(store_department, 'sales_assistant')
    end
    Settings::DEMO_DEPARTMENTS[store_department.department.name]['employees']['store_assistants'].times do
      create_employees(store_department, 'store_assistant')
    end
  end
end

puts 'employees loaded'
