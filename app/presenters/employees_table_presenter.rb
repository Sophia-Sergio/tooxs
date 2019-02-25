class EmployeesTablePresenter < SimpleDelegator
  include Rails.application.routes.url_helpers

  def initialize(employees, params)
    @employees = employees
    @params = params
    @shifts = shifts
  end

  def index
    json = @employees.include_store_department.includes(:roles).as_json(
      include: { store: { only: [:name] }, department: { only: [:name] }, roles: { only: [:name] } },
      only: %i[id email name surname_1 rut avatar]
    )
    json.each do |employee|
      employee[:shifts] = @shifts[employee['id']].uniq
      employee[:link] = employee_path(employee['id'])
      employee[:role] = employee['roles'].first['name']
    end.map { |employee| employee.except('roles') }
  end

  def sales_assistants
    json = @employees.as_json(only: %i[id email name surname_1 rut avatar])
    json.each do |sale_assistant|
      sale_assistant[:shifts] = @shifts[sale_assistant['id']].uniq
      sale_assistant[:link] = employee_path(sale_assistant['id'])
    end
  end

  def sellers(store_dep, period)
    json = @employees.as_json(only: %i[id email name surname_1 rut avatar])
    achievements = @employees.total_achievements(period)
    plan_hours = @employees.plan_hours(@params[:year_start], @params[:month_start])
    goals = sellers_goals(store_dep, plan_hours)
    json.each do |seller|
      seller[:shifts] = @shifts[seller['id']].uniq
      seller[:link] = employee_path(seller['id'])
      seller[:sell] = achievements[seller['id']].round
      seller[:goal] = goals[seller['id']]
      seller[:objective] = (achievements[seller['id']] / goals[seller['id']]).round(2)
    end
  end

  def sellers_goals(store_dep, plan_hours)
    periods = TargetProductivity.periods.keys
    productivities = store_dep.target_productivities.
      where(year: @params[:year_start], month: @params[:month_start]).by_week_period
    productivities.each_with_object({}) do |(week, value), goals|
      plan_hours[week].each do |seller|
        goals[seller.id] ||= 0
        goals[seller.id] += periods.map { |p| seller[p] * value[p] }.sum
      end
    end
  end

  def shifts
    @shifts ||= Employee.where(id: @employees.ids).shifts_ids(@params[:year_start], @params[:month_start])
  end
end
