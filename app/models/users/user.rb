class User < ApplicationRecord
  rolify # management of roles with gem
  before_create :set_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :request
  has_many :shifts, class_name: 'UserShift'
  has_many :worked_shifts
  has_many :achievements

  enum status: { active: 1, inactive: 0 }

  scope :working_on_date, ->(date) { joins(:worked_shifts).where('date = ?', date) }

  def set_role
    add_role self.class.to_s.downcase.to_sym
  end

  def plan_check_in(opts)
    shifts.find_case(opts).work_shift.plan_shifts.find_case(opts).check_in
  end

  def plan_check_out(opts)
    shifts.find_case(opts).work_shift.plan_shifts.find_case(opts).check_out
  end


  def self.working_by_date(date)

  end



  def can_wiew_sale_planification?
    can_view %w[admin gcc gcp gz gt gv jd]
  end

  def can_view_colaborators?
    can_view %w[admin gv jd]
  end

  def can_view_change_plan?
    can_view %w[admin gcc gcp gz gt gv]
  end

  def can_view(roles_admitted)
    role.in?(roles_admitted)
  end
end
