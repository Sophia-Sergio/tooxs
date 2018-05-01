# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all

admin = User.create!(
  name: 'admin',
  lastname: 'sales',
  surname: 'force',
  rut: '111111111',
  email: 'admin@mta.cl',
  password: 'prueba',
  role: 'admin',
  status: 'active'
)

admin = User.create!(
  name: 'Jorge',
  lastname: 'Astudillo',
  surname: 'Andrades',
  rut: '151599516',
  email: 'coke@mta.cl',
  password: 'lala123',
  role: 'admin',
  status: 'active'
)


SaleBySeller.destroy_all

200.times do |i| 
  sale = SaleBySeller.create!(
    seller: 33,
    month: 5,
    week: rand(1..4),
    day: rand(1..7),
    time: rand(1..10), 
    store_id: 1,
    sale: rand(10000..100000),
    turn: 5,
    year:2018
    )
end