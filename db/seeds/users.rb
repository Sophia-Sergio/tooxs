User.create!([
  { email: 'admin@tooxs.com',
    password: '123456',
    name: 'Administrador', surname_1: 'sales', rut: '111111111'},
  {email: 'fperez@tooxs.com', password: '123456', name: 'Sergio', surname_1: 'Torres', rut: '151599516'},
  {email: 'storres@tooxs.com', password: '123456', name: 'Fernando', surname_1: 'Perez', rut: nil, store: Store.find_by(name: 'Alto Las Condes')},
  {email: 'fvallauri@tooxs.com', password: '123456', name: 'Francisco', surname_1: 'Vallauri', rut: nil},
])



puts 'users loaded'
