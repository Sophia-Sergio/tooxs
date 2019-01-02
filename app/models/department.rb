class Department < ApplicationRecord
  has_many :store_departments
  has_many :stores, through: :store_departments
end
