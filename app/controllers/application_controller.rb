class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_current_user_store_department



  private

  def set_current_user_store_department
    if current_user.store && !current_user.store_department
      world = current_user.store.bigger_plan_sale_world
      department = world.bigger_plan_sale_department
      current_user.store_department = StoreDepartment.find_by(
        store: current_user.store, department: department)
    end
  end

end
