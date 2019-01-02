class Cashier < User
  default_scope { joins(:roles).where('users_roles.role_id = ?', 3) }
  belongs_to :store
end
