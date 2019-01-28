Role.delete_all

Role.create!([
  { name: 'admin' },
  { name: 'seller' },
  { name: 'cashier' },
  { name: 'sales_assistant' },
  { name: 'store_assistant' },
  { name: 'fitting_room_assitant' },
  { name: 'store_manager'}
  ])

puts 'roles loaded'
