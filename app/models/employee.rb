class Employee < User
  include CommercialCalendar::Period

  belongs_to :store_department
  delegate :department, to: :store_department, allow_nil: true
  delegate :store, to: :store_department, allow_nil: true
  has_many :work_shifts, through: :shifts

  default_scope { active.joins(:roles).where.not(roles: { name: ['admin'] }) }

  scope :include_store_department, -> { includes(store_department: %i[department store]) }
  scope :sales_assistants, -> { active.includes(:roles).where(roles: { name: 'sales_assistant' }) }
  scope :sellers, -> { active.includes(:roles).where(roles: { name: 'seller' }) }
  scope :working_on_date, ->(date) { joins(:worked_shifts).where('date = ?', date) }
  scope :working_on_period, ->(period) {
    joins(:worked_shifts).where(worked_shifts: { date: period[:start]..period[:end] }).distinct
  }

  def calendar_shift(period = default_period)
    worked_shift_period = { start: period[:start], end: Date.today - 1 }
    plan_shift_period   = { start: Date.today, end: period[:end] }
    worked_shift(worked_shift_period).merge(plan_shift(plan_shift_period))
  end

  def worked_shift(period)
    hash = worked_shifts.between_dates(period).each_with_object({}) do |worked_shift, h|
      h[worked_shift.date] = "#{worked_shift.check_in.strftime('%H:%M')}-#{worked_shift.check_out.strftime('%H:%M')}"
    end
    (period[:start]..period[:end]).each_with_object({}) { |d, h| h[d] = nil }.merge(hash)
  end

  def plan_shift(period)
    date = period[:start]
    hash = shifts.between_dates(period).each_with_object({}) do |shift, h|
      opts = { year: shift.year, month: shift.month, week: shift.week, shift: shift.work_shift_id }
      PlanShift.where(work_shift_id: opts[:shift], week: opts[:week]).
        order(:week, :day).each do |plan_shift|
          next unless (period[:start]..period[:end]).cover? date_by_params(opts.merge(day: plan_shift.day))

          check_in   = plan_shift[:check_in]&.strftime('%H:%M')
          check_out  = plan_shift[:check_out]&.strftime('%H:%M')
          h[date] = "#{check_in}-#{check_out}" if check_in.present? && check_out.present?
          date += 1
        end
    end
    (period[:start]..period[:end]).each_with_object({}) { |d, h| h[d] = nil }.merge(hash)
  end

  def self.count_employees_by_hour(date)
    dates = DateCountStaffQuery.new.call(date)
    dates.keys.map { |day| "#{day.hour} - #{(day.hour + 1)}" }.zip(dates.values).to_h
  end

  def self.employees_by_hour(date)
    DateStaffQuery.new.call(date).each_with_object([]) do |employee, array|
      period = "#{employee.custom_interval.hour} - #{(employee.custom_interval.hour + 1)}"
      array << { name: period, employees: employee.names, ids: employee.ids }
    end
  end

  def self.total_achievements(period)
    joins(:achievements).where(achievements: { date: period[:start]..period[:end] }).
      group('users.id').sum('achievements.total_day')
  end

  # st-check horus
  def self.plan_hours(year, month)
    (1..Settings.weeks_by_month[month.to_i]).each_with_object({}) do |week, hash|
      hash[week] = PlanHoursQuery.new.call(year: year, month: month, week: week)
    end
  end

  def self.shifts_ids(year, month)
    joins(:shifts).where(user_shifts: { year: year, month: month }).
      joins('INNER JOIN work_shifts ON user_shifts.work_shift_id = work_shifts.id').
      select('ARRAY_AGG(work_shifts.id) as array_work_shifts').
      select('users.id').group('users.id').map do |employee|
        [employee.id, employee.array_work_shifts]
      end.to_h
  end

  def plan_check_in(opts)
    shifts.find_case(opts).work_shift.plan_shifts.find_case(opts).check_in
  end

  def plan_check_out(opts)
    shifts.find_case(opts).work_shift.plan_shifts.find_case(opts).check_out
  end
end
