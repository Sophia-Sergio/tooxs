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

  def self.workers_by_hour
    dates = joins(", generate_series(
            worked_shifts.check_in,
            worked_shifts.check_out - interval '1' hour,
            interval '1 hour') custom_interval")
            .group('custom_interval').order('custom_interval').count
    dates.keys.map { |date| "#{date.hour} - #{(date.hour + 1)}" }.zip(dates.values).to_h
  end

  def set_role
    add_role self.class.to_s.downcase.to_sym
  end

  def plan_check_in(opts)
    shifts.find_case(opts).work_shift.plan_shifts.find_case(opts).check_in
  end

  def plan_check_out(opts)
    shifts.find_case(opts).work_shift.plan_shifts.find_case(opts).check_out
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
