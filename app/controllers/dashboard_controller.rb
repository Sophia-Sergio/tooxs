class DashboardController < ApplicationController
  def index
    @filters = current_user.filters
	end
end
