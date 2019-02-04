class Department < ApplicationRecord
  has_many :store_departments, dependent: :destroy
  has_many :stores, through: :store_departments, dependent: :destroy
end
