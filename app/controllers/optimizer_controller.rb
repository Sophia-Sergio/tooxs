class OptimizerController < ApplicationController
  def show
    @filters = Rails.cache.fetch("/current_user/#{current_user.role.name}/filters", expires_in: 1.day) do
      current_user.filters
    end
  end
end
