communes = ["Providencia", "Maipu", "Cerro Navia", "Temuco", "Vitacura", "Puente Alto", "Macul", "San Pedro de la Paz", "La Reina", "La Florida"]


STORES.each do |store|
  store.store_departments.where(department: DEPARTMENTS).each do |store_department|
    Settings::DEMO_DEPARTMENTS[store_department.department.name]['employees']['sellers'].times do
      name = Faker::Name.first_name
      surname_1 = Faker::Name.last_name
      email = "#{name.gsub(/\s/, '.')}.#{surname_1.gsub(/\s/, '.')}@falabella.com"
      phone = "+56 9 #{rand(10000000..99999999)}"

      seller = Seller.new(name: name, surname_1: surname_1, email: email,
                    password: 123456, phone: phone, address: Faker::Address.full_address,
                    commune: communes.sample, store_department: store_department, store: store_department.store)
      seller.save
    end
  end
end
# Seller.create!([
#   {rut: "12.222.108-7", name: "Ricardo", surname_1: "Gonzalez", email: "demo1@tooxs.com", password: 123456, phone: "56999999999", address: "El Vergel 323", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "18.104.462-0", name: "Claudia Andrea", surname_1: "Bravo", email: "demo2@tooxs.com", password: 123456, phone: "56999999999", address: "Los Poetas 234", commune: "Maipu", store_department: store_department, store: store_department.store},
#   {rut: "11.692.224-K", name: "Juan ", surname_1: "Herrera", email: "demo3@tooxs.com", password: 123456, phone: "56999999999", address: "Los espinos 323", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "19.395.784-6", name: "Ulises", surname_1: "Medina", email: "demo4@tooxs.com", password: 123456, phone: "56999999999", address: "Los Conquistadores 64", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "12.637.373-2", name: "Rodrigo", surname_1: "Sanz", email: "demo5@tooxs.com", password: 123456, phone: "56999999999", address: "Mapocho ,", commune: "Cerro Navia", store_department: store_department, store: store_department.store},
#   {rut: "13.619.919-6", name: "Margarita", surname_1: "Cuevas", email: "demo6@tooxs.com", password: 123456, phone: "56999999999", address: "Av Manuel Rodriguez 332", commune: "Temuco", store_department: store_department, store: store_department.store},
#   {rut: "1377.844-5", name: "Pedro", surname_1: "Silva", email: "demo7@tooxs.com", password: 123456, phone: "56999999999", address: "Costanera 22", commune: "Vitacura", store_department: store_department, store: store_department.store},
#   {rut: "19.686.769-4", name: "Pablo", surname_1: "Jara", email: "demo8@tooxs.com", password: 123456, phone: "56999999999", address: "Los Robles 556", commune: "Puente Alto", store_department: store_department, store: store_department.store},
#   {rut: "16.999.197-9", name: "Luis", surname_1: "Sanchez", email: "demo9@tooxs.com", password: 123456, phone: "56999999999", address: "Los Castanos 221", commune: "Macul", store_department: store_department, store: store_department.store},
#   {rut: "17.134.487-1", name: "Ricardo", surname_1: "Urrutia", email: "demo10@tooxs.com", password: 123456, phone: "56999999999", address: "Av. Alemania 6332", commune: "San Pedro de la Paz", store_department: store_department, store: store_department.store},
# ])

# store_department = StoreDepartment.find_by(
#   store:      Store.find_by(name: 'Alto Las Condes'),
#   department: Department.find_by(name: 'Moda Mujer')
# )
# Seller.create!([
#   {rut: "16.599.858-8", name: "Carlos", surname_1: "Paz", email: "demo11@tooxs.com", password: 123456, phone: "56999999999", address: "Av. Sting 664", commune: "La Reina", store_department: store_department, store: store_department.store},
#   {rut: "16.853.640-2", name: "Antonio", surname_1: "Brown", email: "demo12@tooxs.com", password: 123456, phone: "56999999999", address: "Av Balmaceda 313", commune: "Macul", store_department: store_department, store: store_department.store},
#   {rut: "16.423.245-K", name: "Javiera", surname_1: "Ruiz", email: "demo13@tooxs.com", password: 123456, phone: "56999999999", address: "Los Robles 453", commune: "La Florida", store_department: store_department, store: store_department.store},
#   {rut: "8.434.840-3", name: "Alejandra", surname_1: "Fuentes", email: "demo14@tooxs.com", password: 123456, phone: "56999999999", address: "Tobalaba 44", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "8.658.424-7", name: "Juan Pablo", surname_1: "Garcia", email: "demo15@tooxs.com", password: 123456, phone: "56999999999", address: "Vitacura 889", commune: "Vitacura", store_department: store_department, store: store_department.store},
#   {rut: "13.953.401-8 ", name: "Mauricio", surname_1: "Martinez", email: "demo16@tooxs.com", password: 123456, phone: "56999999999", address: "Ricardo Lyon 65", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "12.195.259-5", name: "Francisco", surname_1: "Lillo", email: "demo17@tooxs.com", password: 123456, phone: "56999999999", address: "Pedro de Valdivia 654", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "16.16312-8", name: "Luis", surname_1: "Moya", email: "demo18@tooxs.com", password: 123456, phone: "56999999999", address: "Holanda 64", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "9.431.626-K", name: "Agustin", surname_1: "Perez", email: "demo19@tooxs.com", password: 123456, phone: "56999999999", address: "El Vergel 323", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "1.447.672-2", name: "Claudia Andrea", surname_1: "Fuentes", email: "demo20@tooxs.com", password: 123456, phone: "56999999999", address: "Los Poetas 234", commune: "Maipu", store_department: store_department, store: store_department.store},
#   {rut: "6.309.467-6", name: "Marcela", surname_1: "Gaete", email: "demo21@tooxs.com", password: 123456, phone: "56999999999", address: "Los espinos 323", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "1.377.520-6", name: "Luis", surname_1: "Garcia", email: "demo22@tooxs.com", password: 123456, phone: "56999999999", address: "Los Conquistadores 64", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "16.533.751-4", name: "Maria Jose", surname_1: "Yañez", email: "demo23@tooxs.com", password: 123456, phone: "56999999999", address: "Mapocho ,", commune: "Cerro Navia", store_department: store_department, store: store_department.store},
#   {rut: "16.204.828-7", name: "Luis ", surname_1: "Donoso", email: "demo24@tooxs.com", password: 123456, phone: "56999999999", address: "Av Manuel Rodriguez 332", commune: "Temuco", store_department: store_department, store: store_department.store},
#   {rut: "14.537.332-8", name: "Carla", surname_1: "Cuevas", email: "demo25@tooxs.com", password: 123456, phone: "56999999999", address: "Costanera 22", commune: "Vitacura", store_department: store_department, store: store_department.store},
#   {rut: "8.157.465-0", name: "Lucia", surname_1: "Arellano", email: "demo26@tooxs.com", password: 123456, phone: "56999999999", address: "Los Robles 556", commune: "Puente Alto", store_department: store_department, store: store_department.store},
#   {rut: "8.882.104-1", name: "Francisca ", surname_1: "Pino", email: "demo27@tooxs.com", password: 123456, phone: "56999999999", address: "Av. Alemania 6332", commune: "San Pedro de la Paz", store_department: store_department, store: store_department.store},
#   {rut: "4.830.131-2", name: "Lorena", surname_1: "Rodriguez", email: "demo28@tooxs.com", password: 123456, phone: "56999999999", address: "Av. Sting 664", commune: "La Reina", store_department: store_department, store: store_department.store},
#   {rut: "9.282.670-8", name: "Marcelo", surname_1: "Lorenzini", email: "demo29@tooxs.com", password: 123456, phone: "56999999999", address: "Av Balmaceda 313", commune: "Macul", store_department: store_department, store: store_department.store},
#   {rut: "6.715.688-9", name: "Claudio", surname_1: "Rojas", email: "demo30@tooxs.com", password: 123456, phone: "56999999999", address: "Los Robles 453", commune: "La Florida", store_department: store_department, store: store_department.store},
#   {rut: "8.618.478-8", name: "Felipe", surname_1: "Catalan", email: "demo31@tooxs.com", password: 123456, phone: "56999999999", address: "Tobalaba 44", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "11.711.484-8", name: "Loreto", surname_1: "Valenzuela", email: "demo32@tooxs.com", password: 123456, phone: "56999999999", address: "Vitacura 889", commune: "Vitacura", store_department: store_department, store: store_department.store},
# ])




# store_department = StoreDepartment.find_by(
#   store:      Store.find_by(name: 'Parque Arauco'),
#   department: Department.find_by(name: 'Moda Mujer')
# )
# Seller.create!([
#   {rut: "13.870.284-1", name: "Marcel", surname_1: "Claude", email: "demo33@tooxs.com", password: 123456, phone: "56999999999", address: "Ricardo Lyon 65", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "15.303.704-3", name: "Juan Ramon", surname_1: "Rojas", email: "demo34@tooxs.com", password: 123456, phone: "56999999999", address: "Pedro de Valdivia 654", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "12.421.757-1", name: "Sebastian", surname_1: "Jara", email: "demo35@tooxs.com", password: 123456, phone: "56999999999", address: "Holanda 64", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "12.204.386-0", name: "Lorena", surname_1: "Perez", email: "demo38@tooxs.com", password: 123456, phone: "56999999999", address: "Los Poetas 234", commune: "Maipu", store_department: store_department, store: store_department.store},
#   {rut: "12.503.757-7", name: "Lorena", surname_1: "Quezada", email: "demo40@tooxs.com", password: 123456, phone: "56999999999", address: "12 de octubre 64", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "12.433.826-3", name: "Veronica", surname_1: "Rojas", email: "demo42@tooxs.com", password: 123456, phone: "56999999999", address: "Galvarino 332", commune: "Temuco", store_department: store_department, store: store_department.store},
#   {rut: "14.433.138-2", name: "Maria Jose", surname_1: "Medina", email: "demo44@tooxs.com", password: 123456, phone: "56999999999", address: "Las Horquideas 556", commune: "Puente Alto", store_department: store_department, store: store_department.store},
#   {rut: "13.459.799-8", name: "Claudio", surname_1: "Meneses", email: "demo45@tooxs.com", password: 123456, phone: "56999999999", address: "Renato Sanchez 6332", commune: "San Pedro de la Paz", store_department: store_department, store: store_department.store},
#   {rut: "11.414.981-0", name: "Maritza", surname_1: "Miranda", email: "demo46@tooxs.com", password: 123456, phone: "56999999999", address: "Las Vervenas 664", commune: "La Reina", store_department: store_department, store: store_department.store},
#   {rut: "12.694.230-3", name: "Juan", surname_1: "Paz", email: "demo49@tooxs.com", password: 123456, phone: "56999999999", address: "Los Conquistadores 44", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "4.848.653-3", name: "Tomas", surname_1: "Alcantara", email: "demo52@tooxs.com", password: 123456, phone: "56999999999", address: "Vitacura 654", commune: "Vitacura", store_department: store_department, store: store_department.store},
#   {rut: "6.432.300-8", name: "Loreto", surname_1: "Donoso", email: "demo53@tooxs.com", password: 123456, phone: "56999999999", address: "Puente Viejo 64", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "19.461.711-9", name: "Macarena", surname_1: "Lopez", email: "demo56@tooxs.com", password: 123456, phone: "56999999999", address: "Tobalaba 234", commune: "Maipu", store_department: store_department, store: store_department.store},
#   {rut: "4.148.862-K", name: "Juan Manuel", surname_1: "Rodriguez", email: "demo58@tooxs.com", password: 123456, phone: "56999999999", address: "Tobalaba 64", commune: "Providencia", store_department: store_department, store: store_department.store},
# ])

# store_department = StoreDepartment.find_by(
#   store:      Store.find_by(name: 'Parque Arauco'),
#   department: Department.find_by(name: 'Rincón Juvenil Mujer')
# )
# Seller.create!([
#   {rut: "9.725.248-3", name: "Rocio", surname_1: "Niño", email: "demo37@tooxs.com", password: 123456, phone: "56999999999", address: "El Vergel 323", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "3.589.151-K", name: "Patricia", surname_1: "Lopez", email: "demo39@tooxs.com", password: 123456, phone: "56999999999", address: "E ramirez 323", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "9.221.203-3", name: "Gladis", surname_1: "Cerda", email: "demo41@tooxs.com", password: 123456, phone: "56999999999", address: "Caupolica ,", commune: "Cerro Navia", store_department: store_department, store: store_department.store},
#   {rut: "7.904.309-5", name: "Ricardo", surname_1: "Lazcano", email: "demo43@tooxs.com", password: 123456, phone: "56999999999", address: "Vespucio 22", commune: "Vitacura", store_department: store_department, store: store_department.store},
#   {rut: "17.595.628-K", name: "Pablo", surname_1: "Soto", email: "demo47@tooxs.com", password: 123456, phone: "56999999999", address: "Holanda 313", commune: "Macul", store_department: store_department, store: store_department.store},
#   {rut: "12.751.778-7", name: "Pamela", surname_1: "Ricarte", email: "demo48@tooxs.com", password: 123456, phone: "56999999999", address: "Francisco Bilbao 453", commune: "La Florida", store_department: store_department, store: store_department.store},
#   {rut: "9.372.351-1", name: "Rodrigo", surname_1: "Soto", email: "demo50@tooxs.com", password: 123456, phone: "56999999999", address: "Francia 889", commune: "Vitacura", store_department: store_department, store: store_department.store},
#   {rut: "6.706.128-4", name: "Maria Alejandra", surname_1: "Carmona", email: "demo51@tooxs.com", password: 123456, phone: "56999999999", address: "Pasaje Angostura 65", commune: "Providencia", store_department: store_department, store: store_department.store},
#   {rut: "8.260.273-9", name: "Diana", surname_1: "Tapia", email: "demo54@tooxs.com", password: 123456, phone: "56999999999", address: "Carrascal 221", commune: "Macul", store_department: store_department, store: store_department.store},
#   {rut: "11.805.771-6", name: "Beatriz", surname_1: "Perez", email: "demo57@tooxs.com", password: 123456, phone: "56999999999", address: "Lo Beltran 323", commune: "Providencia", store_department: store_department, store: store_department.store},
# ])

# store_department = StoreDepartment.find_by(
#   store:      Store.find_by(name: 'Parque Arauco'),
#   department: Department.find_by(name: 'Calzado Hombre')
# )
# Seller.create!([
#   {rut: "12.759.330-0", name: "Marcia", surname_1: "Naranjo", email: "demo36@tooxs.com", password: 123456, phone: "56999999999", address: "Los Castanos 221", commune: "Macul", store_department: store_department, store: store_department.store},
#   {rut: "8.291.418-8", name: "Claudia", surname_1: "Ruiz", email: "demo55@tooxs.com", password: 123456, phone: "56999999999", address: "Loreto 323", commune: "Providencia", store_department: store_department, store: store_department.store},
# ])

puts 'sellers loaded'
