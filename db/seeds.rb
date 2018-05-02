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
    week: rand(44..48),
    day: rand(1..7),
    time: rand(1..10), 
    store_id: 1,
    sale: rand(10000..100000),
    turn: 5,
    year:2018
    )
end


HistoricSale.create!([
  {department_id: 5, nine: 0, ten: 0, eleven: 0, twelve: 264600, thirteen: 620439, fourteen: 991321, fifteen: 1126890, sixteen: 847833, seventeen: 1195260, eighteen: 1784051, nineteen: 1307062, twenty: 1639494, twenty_one: 605047, twenty_two: 0, twenty_three: 0, twenty_four: 0, historic_date: "2018-05-01", store_id: 1, week: 1, month: 5, year: 2018, day_number: 1},
  {department_id: 5, nine: 0, ten: 0, eleven: 0, twelve: 264600, thirteen: 441251, fourteen: 1501939, fifteen: 884073, sixteen: 1011784, seventeen: 1025951, eighteen: 1451805, nineteen: 2147288, twenty: 931084, twenty_one: 1053913, twenty_two: 0, twenty_three: 0, twenty_four: 0, historic_date: "2018-05-02", store_id: 1, week: 1, month: 5, year: 2018, day_number: 2}])