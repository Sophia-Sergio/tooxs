class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show]

  def index
    @filters = current_user.filters
  end

  def show
    render json: EmployeePresenter.new(@employee).show
  end

  def staff
    @filters = current_user.filters
  end

  def staff_planning() end

  def departments_staff
    @stores = Store.where(name: Settings::STORES_ALLOWED)
    @departments = @stores.first.departments
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
