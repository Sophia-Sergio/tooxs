class StatisticsController < ApplicationController
  def sales
    @filters = Rails.cache.fetch("/current_user/#{current_user.role.name}/filters/sales", expires_in: 1.day) do
      current_user.filters('sales')
    end
  end

  def hours
    @filters = Rails.cache.fetch("/current_user/#{current_user.role.name}/filters/hours", expires_in: 1.day) do
      current_user.filters('hours')
    end
  end

  def productivity() end

  def efficiency
    @stores = Store.where(name: Settings::STORES_ALLOWED)
    @departments = @stores.first.departments
  end
end
