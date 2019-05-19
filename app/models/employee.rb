class Employee < User
  include CommercialCalendar::Period
  extend CommercialCalendar::Period
  include Defaults

  belongs_to :store_department
  delegate :department, to: :store_department, allow_nil: true
  delegate :store, to: :store_department, allow_nil: true
  has_many :work_shifts, through: :shifts
  has_many :shift_breaks, foreign_key: 'user_id'
  has_many :worked_shifts, foreign_key: 'user_id'
  has_many :planned_shifts, foreign_key: 'user_id'

  default_scope { active.joins(:roles).where.not(roles: { name: ['admin'] }) }

  scope :include_store_department, -> { includes(store_department: %i[department store]) }
  scope :sales_assistants, -> { active.includes(:roles).where(roles: { name: 'sales_assistant' }) }
  scope :sellers, -> { active.includes(:roles).where(roles: { name: 'seller' }) }
  scope :working_on_date, ->(date) { joins(:worked_shifts).where('date = ?', date) }
  scope :planned_working_on_date, ->(date) { joins(:planned_shifts).where('date = ?', date) }
  scope :working_on_period, ->(period) {
    joins(:worked_shifts).where(worked_shifts: { date: period[:start]..period[:end] }).distinct
  }

  def calendar_shift(period)
    worked_shift_period = { start: period[:start], end: default_date - 1 }
    plan_shift_period   = { start: default_date, end: period[:end] }
    worked_shifts_dates(worked_shift_period).merge(plan_shifts_dates(plan_shift_period))
  end

  def worked_shifts_dates(period)
    hash = worked_shifts.between_dates(period).each_with_object({}) do |worked_shift, h|
      shift = "#{worked_shift.check_in.strftime('%H:%M')} - #{worked_shift.check_out.strftime('%H:%M')}"
      h[worked_shift.date] = shift
    end
    (period[:start]..period[:end]).each_with_object({}) { |d, h| h[d] = nil }.merge(hash)
  end

  def plan_shifts_dates(period)
    date = period[:start]
    hash = shifts.between_dates(period).each_with_object({}) do |shift, h|
      opts = { year: shift.year, month: shift.month, week: shift.week, shift: shift.work_shift_id }
      PlanShift.where(work_shift_id: opts[:shift], week: opts[:week]).
        order(:week, :day).each do |plan_shift|
          next unless (period[:start]..period[:end]).cover? date_by_params(opts.merge(day: plan_shift.day))

          check_in   = plan_shift[:check_in]&.strftime('%H:%M')
          check_out  = plan_shift[:check_out]&.strftime('%H:%M')
          h[date] = "#{check_in} - #{check_out}" if check_in.present? && check_out.present?
          date += 1
        end
    end
    (period[:start]..period[:end]).each_with_object({}) { |d, h| h[d] = nil }.merge(hash)
  end

  def self.count_employees_by_hour(date)
    day_hours = DateCountStaffQuery.new.call(date, 'worked_shifts')
    day_hours.keys.map { |day| "#{day.hour} - #{(day.hour + 1)}" }.zip(day_hours.values).to_h
  end

  # planned_shifts (new table for manaing employees shifts)
  def self.count_planned_employees_by_hour(date)
    day_hours = DateCountStaffQuery.new.call(date, 'planned_shifts')
    day_hours.keys.map { |day| "#{day.hour} - #{(day.hour + 1)}" }.zip(day_hours.values).to_h
  end

  def self.employees_by_hour(date)
    DateStaffQuery.new.call(date).each_with_object([]) do |employee, array|
      period = "#{employee.custom_interval.hour} - #{(employee.custom_interval.hour + 1)}"
      array << { name: period, employees: employee.names, ids: employee.ids }
    end
  end

  def self.total_achievements(period)
    joins(:achievements).where(achievements: { date: period[:start]..period[:end]}).
      group('achievements.user_id').sum('DISTINCT(achievements.total_day)')
  end

  def self.shifts_ids(year, month)
    joins(:shifts).where(user_shifts: { year: year, month: month }).
      joins('INNER JOIN work_shifts ON user_shifts.work_shift_id = work_shifts.id').
      select('ARRAY_AGG(work_shifts.id) as array_work_shifts').
      select('users.id').group('users.id').map do |employee|
        [employee.id, employee.array_work_shifts]
      end.to_h
  end

  def target_achievements(period = default_period)
    achievements = store_department.target_productivities.by_date_hour(period)
    (period[:start]..period[:end]).each_with_object({}) do |date, hash|
      shifts_breaks = shift_breaks.date(date).break_times
      shifts_breaks.keys.each { |hour| achievements[date][hour] *= shifts_breaks[hour] }
      hash[date] = achievements[date].slice(*hours_period_should_work(date)).values.sum
    end
  end

  def hours_period_should_work(date = default_date)
    opts = { week: week_by_date(date), day: day_number(date) }
    work_shift.plan_shifts.find_case(opts).hours_should_work
  end

  def plan_check_in(opts)
    shifts.find_case(opts).work_shift.plan_shifts.find_case(opts).check_in
  end

  def plan_check_out(opts)
    shifts.find_case(opts).work_shift.plan_shifts.find_case(opts).check_out
  end

  def achievements_labor_month_until_today
    month_period = month_period(year_by_date(default_date), month_by_date(default_date))
    period = { start: month_period[:start], end: default_date }
    achievements.between(period)
  end

  def work_shift(opts = {})
    opts = opts.present? ? opts : default_year_month_week
    shifts.find_by(user_shifts: opts).work_shift
  end

  def working_today?
    worked_shifts.find_by(date: default_date).present?
  end

  def should_work_today?
    opts = { week: week_by_date(default_date), day: day_number(default_date) }
    work_shift.plan_shifts.find_case(opts).check_in.present?
  end
end
