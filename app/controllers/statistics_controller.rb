class StatisticsController < ApplicationController
  def sales
    @filters = current_user.filters('sales')
  end

  def hours() end

  def productivity() end

  def efficiency
    @stores = Store.where(name: Settings::STORES_ALLOWED)
    @departments = @stores.first.departments
  end
end
