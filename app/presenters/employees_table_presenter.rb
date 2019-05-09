class EmployeesTablePresenter < StatsPresenter
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

  def sellers(period)
    json = @employees.as_json(only: %i[id email name surname_1 rut avatar])
    achievements = @employees.total_achievements(period)

    json.each do |seller|
      goal = Employee.find(seller['id']).target_achievements(period).values.sum
      seller[:shifts] = @shifts[seller['id']].uniq
      seller[:link] = employee_path(seller['id'])
      seller[:sell] = number_with_delimiter(achievements[seller['id']].round)
      seller[:goal] = goal
      seller[:objective] = (achievements[seller['id']] / goal).round(2)
    end
  end

  def shifts
    @shifts ||= Employee.where(
      id: @employees.ids).shifts_ids(@params[:year_start], @params[:month_start])
  end
end
