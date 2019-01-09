class User < ApplicationRecord
  rolify # management of roles with gem
  before_create :set_role
  belongs_to :store

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
  scope :working_on_period, ->(start_date, end_date) {
    joins(:worked_shifts).
    where('worked_shifts.date between ? AND ?', start_date, end_date).distinct
  }

  def self.employees_by_hour
    dates = joins(", generate_series(
      worked_shifts.check_in,
      worked_shifts.check_out - interval '1' hour,
      interval '1 hour') custom_interval").
      group('custom_interval').order('custom_interval').count
    dates.keys.map { |date| "#{date.hour} - #{(date.hour + 1)}" }.zip(dates.values).to_h
  end

  def self.total_achievements(start_date, end_date)
    joins(:achievements).where('achievements.date between ? AND ?', start_date, end_date).
      group('users.id').sum('achievements.total_day')
  end

  # st-check horus
  def self.plan_hours(year, month)
    (1..Settings.weeks_by_month[month.to_i]).each_with_object({}) do |week, hash|
      hash[week] = joins(:shifts).
        where(user_shifts: { year: year, month: month, week: week, status: UserShift.statuses[:active] }).
        joins('INNER JOIN work_shifts ON user_shifts.work_shift_id = work_shifts.id').
        joins('INNER JOIN plan_shifts ON plan_shifts.work_shift_id = work_shifts.id
          AND user_shifts.week = plan_shifts.week').
        select("SUM(CASE
          WHEN plan_shifts.check_in < '2000-01-01 13:00' AND plan_shifts.day <= 5 THEN
            DATE_PART('hour', '2000-01-01 13:00:00'::time - plan_shifts.check_in::time)
          ELSE 0 END) AS monday_friday_am").
        select("SUM(CASE
          WHEN plan_shifts.check_in <= '2000-01-01 13:00' AND plan_shifts.day <= 5 THEN
            DATE_PART('hour', plan_shifts.check_out::time - '2000-01-01 13:00:00')
          WHEN plan_shifts.check_in >= '2000-01-01 13:00' AND plan_shifts.day <= 5 THEN
            DATE_PART('hour', plan_shifts.check_out::time - plan_shifts.check_in::time)
          ELSE 0 END) AS monday_friday_pm").
        select("SUM(CASE
          WHEN plan_shifts.check_in < '2000-01-01 13:00' AND plan_shifts.day >= 6 THEN
            DATE_PART('hour', '2000-01-01 13:00:00'::time - plan_shifts.check_in::time)
          ELSE 0 END) AS saturday_sunday_am").
        select("SUM(CASE
          WHEN plan_shifts.check_in <= '2000-01-01 13:00' AND plan_shifts.day >= 6 THEN
            DATE_PART('hour', plan_shifts.check_out::time - '2000-01-01 13:00:00')
          WHEN plan_shifts.check_in >= '2000-01-01 13:00' AND plan_shifts.day >= 6 THEN
            DATE_PART('hour', plan_shifts.check_out::time - plan_shifts.check_in::time)
          ELSE 0 END) AS saturday_sunday_pm").
        select('users.id').group('users.id')
    end
  end

  def self.shifts_ids(year, month)
    joins(:shifts).
      where(user_shifts: { year: year, month: month }).
      joins('INNER JOIN work_shifts ON user_shifts.work_shift_id = work_shifts.id').
      select('ARRAY_AGG(work_shifts.id) as work_shifts').
      select('users.id').group('users.id').map do |seller|
        [seller.id, seller.work_shifts]
      end.to_h
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

  # def can_wiew_sale_planification?
  #   can_view %w[admin gcc gcp gz gt gv jd]
  # end

  # def can_view_colaborators?
  #   can_view %w[admin gv jd]
  # end

  # def can_view_change_plan?
  #   can_view %w[admin gcc gcp gz gt gv]
  # end

  # def can_view(roles_admitted)
  #   role.in?(roles_admitted)
  # end
end
