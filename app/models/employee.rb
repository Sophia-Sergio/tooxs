class Employee < User
  belongs_to :store_department
  delegate :department, to: :store_department, allow_nil: true
  delegate :store, to: :store_department, allow_nil: true

  default_scope { active.joins(:roles).where.not(roles: { name: ['admin'] }) }

  scope :include_store_department, -> { includes(store_department: [:department, :store]) }
  scope :sales_assistants, -> { active.includes(:roles).where(roles: { name: 'sales_assistant' }) }
  scope :sellers, -> { active.includes(:roles).where(roles: { name: 'seller' }) }
  scope :working_on_date, ->(date) { joins(:worked_shifts).where('date = ?', date) }
  scope :working_on_period, ->(period) {
    joins(:worked_shifts).where(worked_shifts: { date: period[:start]..period[:end] }).distinct
  }

  def self.employees_by_hour(date)
    DateStaffQuery.new.call(date).each_with_object({}) do |employee, hash|
      period = "#{employee.custom_interval.hour} - #{(employee.custom_interval.hour + 1)}"
      hash[period] = { count: employee.ids.count, names: employee.names, ids: employee.ids }
    end
  end

  def self.total_achievements(period)
    joins(:achievements).where(achievements: { date: period[:start]..period[:end] }).
      group('users.id').sum('achievements.total_day')
  end

  # st-check horus
  def self.plan_hours(year, month)
    (1..Settings.weeks_by_month[month.to_i]).each_with_object({}) do |week, hash|
      hash[week] = PlanHoursQuery.new.call({ year: year, month: month, week: week })
    end
  end

  def self.shifts_ids(year, month)
    joins(:shifts).where(user_shifts: { year: year, month: month }).
      joins('INNER JOIN work_shifts ON user_shifts.work_shift_id = work_shifts.id').
      select('ARRAY_AGG(work_shifts.id) as work_shifts').
      select('users.id').group('users.id').map do |employee|
        [employee.id, employee.work_shifts]
      end.to_h
  end

  def plan_check_in(opts)
    shifts.find_case(opts).work_shift.plan_shifts.find_case(opts).check_in
  end

  def plan_check_out(opts)
    shifts.find_case(opts).work_shift.plan_shifts.find_case(opts).check_out
  end
end