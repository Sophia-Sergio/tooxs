class User < ApplicationRecord
  include CommercialCalendar::Period

  include Stats::Filter
  include Defaults
  include ApplicationHelper

  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :store_department, optional: true
  belongs_to :store, optional: true

  has_one :users_role, foreign_key: 'user_id'
  has_many :request
  has_many :shifts, class_name: 'UserShift'
  has_many :achievements

  enum status: { active: 1, inactive: 0 }

  def avatar
    type  = ['women', 'men'].sample
    photo = (1..99).to_a.sample
    "https://randomuser.me/api/portraits/#{type}/#{photo}.jpg"
  end

  def rut
    '12.345.678-9'
  end

  def filters(view)
    filter_by_view(view)
  end

  def role
    users_role.role
  end
end
