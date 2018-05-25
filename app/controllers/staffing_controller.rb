class StaffingController < ApplicationController
  def index

    @month = Date.today.strftime("%m").to_i
    @year = Date.today.strftime("%Y").to_i
    @store = 1
    @dep = 1

    #days of the week for this query dias de la semana según comienzo
    @w1_days = SalePlan.where(:month => @month).where(:day_number => [1..7]).where(:week => 1, store_id: @store, department_id: @dep).where(:year => @year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
    @w2_days = SalePlan.where(:month => @month).where(:day_number => [1..7]).where(:week => 2, store_id: @store, department_id: @dep).where(:year => @year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
    @w3_days = SalePlan.where(:month => @month).where(:day_number => [1..7]).where(:week => 3, store_id: @store, department_id: @dep).where(:year => @year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}
    @w4_days = SalePlan.where(:month => @month).where(:day_number => [1..7]).where(:week => 4, store_id: @store, department_id: @dep).where(:year => @year).select(:sale_date).pluck(:sale_date).map{|x| x.strftime('%d-%m-%Y').to_sym}


    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Dotación personal", :staffing_index_path
  	@search       = ''
    @stores       = Store.all.order(:id)
    @departments  = Department.all.order(:id)
    #staffing
    fecha1 = DateTime.parse(@w1_days[0].to_s) 
    fecha1 = fecha1.strftime("%Y%m%d")

    fecha2 = DateTime.parse(@w2_days[0].to_s) 
    fecha2 = fecha2.strftime("%Y%m%d")

    fecha3 = DateTime.parse(@w3_days[0].to_s) 
    fecha3 = fecha3.strftime("%Y%m%d")

    fecha4 = DateTime.parse(@w4_days[0].to_s) 
    fecha4 = fecha4.strftime("%Y%m%d")

    @staffing_w1  = staffing_draw(fecha1)
    @staffing_w2  = staffing_draw(fecha2)
    @staffing_w3  = staffing_draw(fecha3)
    @staffing_w4  = staffing_draw(fecha4)

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