departments = Department.where(name: Settings::DEPARTMENTS_ALLOWED)

STORES.each do |store|
  store.store_departments.where(department: departments).each do |store_department|
    if store_department.department.name = 'Electrodomésticos'
      store_department.categories << Category.where(cod: [
        'j140601','j110903','j110904','j110905','j110906','j111001','j111002','j111003',
        'j111004','j111005','j111006','j111007','j111008','j111009','j111101','j111102',
        'j111103','j111104','j111105','j111106','j111107','j111108','j111109','j111110'])
    end
    if store_department.department.name = 'Audio y Video'
      store_department.categories << Category.where(cod: [
        'j160205','j110102','j110103','j110104','j110106','j110201','j110202','j110203',
        'j110204','j110206','j110207','j110208','j110209','j110210','j111401'])
    end
  end
end

puts 'store_departments_categories loaded'