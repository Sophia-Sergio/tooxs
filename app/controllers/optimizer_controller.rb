class OptimizerController < ApplicationController
  def show
    @filters = Rails.cache.fetch("/current_user/#{current_user.role.name}/filters/optimizer", expires_in: 1.day) do
      current_user.filters('optimizer')
    end
  end
end
