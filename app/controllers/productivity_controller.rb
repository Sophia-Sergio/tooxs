class ProductivityController < ApplicationController

  def index
    params[:year]  = Date.today.strftime("%Y").to_i
    params[:month] = Date.today.strftime("%m").to_i
    params[:department] = 1
    params[:store] = 1


    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Buscar", :productivity_index_path    
    @search       = ''
    @stores       = Store.all.order(:id)
    @departments  = Department.all.order(:id)
  end

  def show
    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Buscar", :productivity_index_path   
    add_breadcrumb "Productividad", :productivity_show_path    
  	@search       = ''
    @stores       = Store.all.order(:id)
    @departments  = Department.all.order(:id)

    month  = params[:month].to_i
    year   = params[:year].to_i  
    @store = params[:store].to_i
    @dep   = params[:department].to_i

    #dates per month

    m1 = Sp.where(:month => month).where(:dow => [1..7]).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    #dates per week fecha de comienzo de la semana
    w1 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 1).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    w2 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 2).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    w3 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 3).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    w4 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 4).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}

    #days of the week for this query dias de la semana según comienzo
    @w1_days = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 1).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%d-%m-%Y').to_sym}
    @w2_days = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 2).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%d-%m-%Y').to_sym}
    @w3_days = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 3).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%d-%m-%Y').to_sym}
    @w4_days = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 4).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%d-%m-%Y').to_sym}

    #sales plan per week plan de venta total por semana
    @sp_w1 = Sp.where(year: year).where(month: month).where(week: 1).sum(:sale)
    @sp_w2 = Sp.where(year: year).where(month: month).where(week: 2).sum(:sale)
    @sp_w3 = Sp.where(year: year).where(month: month).where(week: 3).sum(:sale)
    @sp_w4 = Sp.where(year: year).where(month: month).where(week: 4).sum(:sale)

    @sp_m1 = Sp.where(year: year).where(month: month).where("week IN(?,?,?,?)", 1, 2, 3, 4).pluck(:sale)
    #sales plan per day plan de venta total por día 

    @sp_w1_daily = Sp.where(year: year).where(month:month).where(week: 1).pluck(:sale)
    @sp_w2_daily = Sp.where(year: year).where(month:month).where(week: 2).pluck(:sale)
    @sp_w3_daily = Sp.where(year: year).where(month:month).where(week: 3).pluck(:sale)
    @sp_w4_daily = Sp.where(year: year).where(month:month).where(week: 4).pluck(:sale)

    #staffdrawing per week turnos hora por semana 
    @sd_w1 = staffing_draw(w1)[:draw].values.flatten.sum
    @sd_w2 = staffing_draw(w2)[:draw].values.flatten.sum
    @sd_w3 = staffing_draw(w3)[:draw].values.flatten.sum
    @sd_w4 = staffing_draw(w4)[:draw].values.flatten.sum
 
    #staffdrawing per day-week turnos hora por semana
    @sd_w1_daily  = staffing_draw(w1)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}
    @sd_w2_daily  = staffing_draw(w2)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}
    @sd_w3_daily  = staffing_draw(w3)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}
    @sd_w4_daily  = staffing_draw(w4)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}


    #productivity per day-week

    @prd_w1_day = @sp_w1_daily.zip(@sd_w1_daily).map{|a,b| a/b }
    @prd_w2_day = @sp_w2_daily.zip(@sd_w2_daily).map{|a,b| a/b }
    @prd_w3_day = @sp_w3_daily.zip(@sd_w3_daily).map{|a,b| a/b }
    @prd_w4_day = @sp_w4_daily.zip(@sd_w4_daily).map{|a,b| a/b }

    #productivity per week-month
    @prd_w1 = (@sp_w1 / @sd_w1)
    @prd_w2 = (@sp_w2 / @sd_w2)
    @prd_w3 = (@sp_w3 / @sd_w3)
    @prd_w4 = (@sp_w4 / @sd_w4)
    
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

  def json_current

    #dummy demo data
    month  = params[:month].to_i
    year   = params[:year].to_i  
    @store = params[:store].to_i
    @dep   = params[:department].to_i
    #dates per week
    w1 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 1).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    w2 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 2).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    w3 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 3).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    w4 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 4).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}


    #days of the week for this query
    @w1_days = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 1).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%d-%m-%Y').to_sym}
    @w2_days = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 2).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%d-%m-%Y').to_sym}
    @w3_days = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 3).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%d-%m-%Y').to_sym}
    @w4_days = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 4).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%d-%m-%Y').to_sym}

    #sales plan per week
    @sp_w1 = Sp.where(year: year).where(month: month).where(week: 1).sum(:sale)
    @sp_w2 = Sp.where(year: year).where(month: month).where(week: 2).sum(:sale)
    @sp_w3 = Sp.where(year: year).where(month: month).where(week: 3).sum(:sale)
    @sp_w4 = Sp.where(year: year).where(month: month).where(week: 4).sum(:sale)
    
    @sp_m1 = Sp.where(year: year).where(month: month).where("week IN(?,?,?,?)", 1, 2, 3, 4).pluck(:sale)
    #sales plan per day

    @sp_w1_daily = Sp.where(year: year).where(month:month).where(week: 1).pluck(:sale)
    @sp_w2_daily = Sp.where(year: year).where(month:month).where(week: 2).pluck(:sale)
    @sp_w3_daily = Sp.where(year: year).where(month:month).where(week: 3).pluck(:sale)
    @sp_w4_daily = Sp.where(year: year).where(month:month).where(week: 4).pluck(:sale)


    #staffdrawing per week
    @sd_w1 = staffing_draw(w1)[:draw].values.flatten.sum
    @sd_w2 = staffing_draw(w2)[:draw].values.flatten.sum
    @sd_w3 = staffing_draw(w3)[:draw].values.flatten.sum
    @sd_w4 = staffing_draw(w4)[:draw].values.flatten.sum

    #staffdrawing per day-week
    @sd_w1_daily  = staffing_draw(w1)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}
    @sd_w2_daily  = staffing_draw(w2)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}
    @sd_w3_daily  = staffing_draw(w3)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}
    @sd_w4_daily  = staffing_draw(w4)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}


    #productivity per day-week

    @prd_w1_day = @sp_w1_daily.zip(@sd_w1_daily).map{|a,b| a/b }
    @prd_w2_day = @sp_w2_daily.zip(@sd_w2_daily).map{|a,b| a/b }
    @prd_w3_day = @sp_w3_daily.zip(@sd_w3_daily).map{|a,b| a/b }
    @prd_w4_day = @sp_w4_daily.zip(@sd_w4_daily).map{|a,b| a/b }


    @data = { :dates_week => @w1_days ,
              :dates_week_2 => @w2_days,
              :dates_week_3 => @w3_days ,
              :dates_week_4 => @w4_days , 
              :sp => @sp_w1_daily, 
              :sd => @sd_w1_daily, 
              :prd => @prd_w1_day, 
              :prd1 => @prd_w2_day,
              :prd2 => @prd_w3_day, 
              :prd3 => @prd_w4_day,
              :spm1 => @sp_m1 
            }

    render json: @data
  end
end
