class EfficiencyController < ApplicationController
  include DemoParameters
  skip_before_action :verify_authenticity_token, only: [:report_post]

	def index

	end

  def report

  end


  def report_data department, store, year, month

  end

  def report_post

  end


  def report_data

  end
end
