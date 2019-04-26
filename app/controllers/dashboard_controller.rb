class DashboardController < ApplicationController
  def index
    @filters = Rails.cache.fetch("/current_user/#{current_user.role.name}/filters", expires_in: 1.day) do
      current_user.filters('dashboard')
    end
  end
end
