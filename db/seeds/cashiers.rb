store = Store.find_by(name: 'Alto Las Condes')

Cashier.create!([
  {rut: '8.291.418-8', name: 'Amaya', surname_1: 'Torres', email: 'demo59@tooxs.com', password: 123456, phone: '56999999999', address: 'Loreto 323', commune: 'Providencia', store: store},
  {rut: '19.461.711-9', name: 'Sofía', surname_1: 'Torres', email: 'demo60@tooxs.com', password: 123456, phone: '56999999999', address: 'Tobalaba 234', commune: 'Maipu', store: store},
  {rut: '11.805.771-6', name: 'Sergio', surname_1: 'Torres', email: 'demo61@tooxs.com', password: 123456, phone: '56999999999', address: 'Lo Beltran 323', commune: 'Providencia', store: store},
  {rut: '4.148.862-K', name: 'David', surname_1: 'Torres', email: 'demo62@tooxs.com', password: 123456, phone: '56999999999', address: 'Lo Beltran 64', commune: 'Providencia', store: store},
])

puts 'cashiers loaded'
