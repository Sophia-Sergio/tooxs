User.create!([
  {email: 'admin@tooxs.com', password: '123456', name: 'Administrador', surname_1: 'sales', picture: nil, status: 1, rut: '111111111'},
  {email: 'fperez@tooxs.com', password: '123456', name: 'Sergio', surname_1: 'Torres', picture: nil, status: 1, rut: '151599516'},
  {email: 'storres@tooxs.com', password: '123456', name: 'Fernando', surname_1: 'Perez', picture: '', status: 1, rut: ''},
  {email: 'fvallauri@tooxs.com', password: '123456', name: 'Francisco', surname_1: 'Vallauri', picture: '', status: 1, rut: ''},
])

puts 'users loaded'
