class User < ApplicationRecord
  include Statistics::Filters
  include Statistics::Defaults
  rolify # management of roles with gem
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

  def filters
    {
      years: self.years_filter,
      year: { value: Settings.year_by_date(Date.today), label: Settings.year_by_date(Date.today)},
      month: {
        value: Settings.month_by_date(Date.today),
        label: Settings.month_name[Settings.month_by_date(Date.today)]
      },
      store: store.as_json(only: [:id, :name]),
      worlds_departments: store.worlds.distinct.as_json(store.id),
      world_selected: store.bigger_plan_sale_world.as_json(store.id)
    }
  end
end
