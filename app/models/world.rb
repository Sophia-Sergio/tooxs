class World < ApplicationRecord
  has_many :store_departments
  has_many :departments, through: :store_departments

end
