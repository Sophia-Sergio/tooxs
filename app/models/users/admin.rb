class Cashier < User
  default_scope { joins(:roles).where('users_roles.role_id = ?', 1) }
end
