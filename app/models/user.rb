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

  has_many :request
  has_many :shifts, class_name: 'UserShift'
  has_many :worked_shifts
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

  def filters(date = Date.today)
    {
      years: years_filter,
      year: { value: default_year, label: default_year },
      month: { value: month_by_date(date), label: month_name(month_by_date(date)) },
      store: store.as_json(only: %i[id name]),
      worlds_departments: store.worlds.distinct.as_json(store.id),
      world_selected: store.bigger_plan_sale_world.as_json(store.id)
    }
  end
end
