class EmployeesTablePresenter < SimpleDelegator
  include Rails.application.routes.url_helpers

  def initialize(employees, params)
    @employees = employees
    @params = params
    @shifts = shifts
  end

end
