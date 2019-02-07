class StatisticsController < ApplicationController
  include FilterParameters

  def sales
    @filters = current_user.filters
  end

  def hours

  end
  def productivity

  end

  def efficiency
    @stores = Store.where(name: Settings::STORES_ALLOWED)
    @departments = @stores.first.departments
  end
end

