StoreManager.create!(
  name: 'Sergio',
  surname_1: 'Torres',
  password: 123456,
  email: 'store_manager@falabella.com',
  store: Store.find_by(name: Settings::STORE_ALLOWED)
)