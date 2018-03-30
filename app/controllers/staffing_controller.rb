class StaffingController < ApplicationController
  def index
  	@search       = ''
    @stores       = Store.all.order(:id)
    @departments  = Department.all.order(:id)
    @staffing_w1  = staffing_draw(20171106)
    @staffing_w2  = staffing_draw(20171113)
    @staffing_w3  = staffing_draw(20171120)
    @staffing_w4  = staffing_draw(20171127)

    #binding.pry
  end

  def random_data
 
 	@html = random_html
# 	binding.pry

  end
  helper_method :random_data

  private 
  	def random_staffing_on
  		on = rand(0..6)
  	end

  	def random_staffing_off
  		off = rand(0..3)
  	end

  	def random_sellers(n,m)
  		on 	= Seller.all.limit(n)
  		off = Seller.all.limit(m).offset(n)

  		sellers = {on: on, off: off}
  	end

  	def random_html
  	on 	= random_staffing_on
    off = random_staffing_off

    sellers_day = random_sellers(on,off) 

    sellers_on = ""
    sellers_off = ""

	sellers_day[:on].each do |s|
		sellers_on = sellers_on + s.fullname + '<br>'
	end

	sellers_day[:off].each do |s|
		sellers_off = sellers_off + s.fullname + '<br>'
	end


    @html = '<span class="label label-success tip" data-toggle="tooltip" data-original-title="'+sellers_on+'">'+on.to_s+'</span> / <span class="label label-warning tip" data-toggle="tooltip" data-original-title="'+sellers_off+'">'+off.to_s+'</span>'
  	end


end