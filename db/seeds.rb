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