class EmployeesController < ApplicationController
  def index() end

  def staff()end

  def staff_planning() end

  def departments_staff
    @stores = Store.where(name: Settings::STORES_ALLOWED)
    @departments = @stores.first.departments
  end
end
