class EmployeesController < ApplicationController
  before_action :set_employee, only: %i[show]

  def index
    @filters = Rails.cache.fetch("/current_user/#{current_user.role.name}/filters/employees", expires_in: 1.day) do
      current_user.filters('employees')
    end
  end

  def show
    @employee = EmployeePresenter.new(@employee).show
  end

  def staff
    @filters = Rails.cache.fetch("/current_user/#{current_user.role.name}/filters/staff", expires_in: 1.day) do
      current_user.filters('staff')
    end
  end

  def staff_planning
    @filters = Rails.cache.fetch("/current_user/#{current_user.role.name}/filters/staff_planning", expires_in: 1.day) do
      current_user.filters('staff_planning')
    end
  end

  def departments_staff
    @stores = Store.where(name: Settings::STORES_ALLOWED)
    @departments = @stores.first.departments
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
