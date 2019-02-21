class EmployeesController < ApplicationController
  def index
    @filters = current_user.filters
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def staff
    @filters = current_user.filters
  end

  def staff_planning() end

  def departments_staff
    @stores = Store.where(name: Settings::STORES_ALLOWED)
    @departments = @stores.first.departments
  end
end
