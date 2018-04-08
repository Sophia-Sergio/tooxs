class ProductivityController < ApplicationController
  
  def show
  	@search       = ''
    @stores       = Store.all.order(:id)
    @departments  = Department.all.order(:id)

    month = 3
    year = 2018

    @store  = 1
    @dep    = 1

    #dates per month

    m1 = Sp.where(:month => month).where(:dow => [1..7]).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}

    #dates per week
    w1 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 1).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    w2 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 2).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    w3 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 3).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    w4 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 4).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}

    #days of the week for this query
    @w1_days = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 1).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    @w2_days = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 2).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    @w3_days = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 3).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    @w4_days = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 4).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}

    #sales plan per week
    @sp_w1 = Sp.where(year: year).where(month: month).where(week: 1).sum(:sale)
    @sp_w2 = Sp.where(year: year).where(month: month).where(week: 2).sum(:sale)
    @sp_w3 = Sp.where(year: year).where(month: month).where(week: 3).sum(:sale)
    @sp_w4 = Sp.where(year: year).where(month: month).where(week: 4).sum(:sale)

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

    #productivity per week-month
    @prd_w1 = (@sp_w1 / @sd_w1)
    @prd_w2 = (@sp_w2 / @sd_w2)
    @prd_w3 = (@sp_w3 / @sd_w3)
    @prd_w4 = (@sp_w4 / @sd_w4)
    
    #/

    #staffing 
    @staffing_w1  = staffing_draw(20180201)
    @staffing_w2  = staffing_draw(20180207)
    @staffing_w3  = staffing_draw(20180214)
    @staffing_w4  = staffing_draw(20180221)
    #binding.pry
  end

  def json_current

    #dummy demo data
    month = 3
    year = 2018

    @store  = 1
    @dep    = 1

    #dates per week
    w1 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 1).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    w2 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 2).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    w3 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 3).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    w4 = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 4).where(:year => year).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}


    #days of the week for this query
    @w1_days = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 1).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    @w2_days = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 2).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    @w3_days = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 3).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    @w4_days = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 4).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}

    #sales plan per week
    @sp_w1 = Sp.where(year: year).where(month: month).where(week: 1).sum(:sale)
    @sp_w2 = Sp.where(year: year).where(month: month).where(week: 2).sum(:sale)
    @sp_w3 = Sp.where(year: year).where(month: month).where(week: 3).sum(:sale)
    @sp_w4 = Sp.where(year: year).where(month: month).where(week: 4).sum(:sale)

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


    #history sales 2017
    
    year_h = 2018
    month = 2

    #dates per week
    w1_h = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 1).where(:year => year_h).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    w2_h = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 2).where(:year => year_h).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    w3_h = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 3).where(:year => year_h).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    w4_h = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 4).where(:year => year_h).where(:dow => 1).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}


    #days of the week for this query
    @w1_days_h = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 1).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    @w2_days_h = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 2).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    @w3_days_h = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 3).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}
    @w4_days_h = Sp.where(:month => month).where(:dow => [1..7]).where(:week => 4).where(:year => year).select(:date).pluck(:date).map{|x| x.strftime('%Y%m%d').to_sym}

    #sales plan per week
    @sp_w1_h = Sp.where(year: year).where(month: month).where(week: 1).sum(:sale)
    @sp_w2_h = Sp.where(year: year).where(month: month).where(week: 2).sum(:sale)
    @sp_w3_h = Sp.where(year: year).where(month: month).where(week: 3).sum(:sale)
    @sp_w4_h = Sp.where(year: year).where(month: month).where(week: 4).sum(:sale)

    #sales plan per day

    @sp_w1_daily_h = Sp.where(year: year).where(month:month).where(week: 1).pluck(:sale)
    @sp_w2_daily_h = Sp.where(year: year).where(month:month).where(week: 2).pluck(:sale)
    @sp_w3_daily_h = Sp.where(year: year).where(month:month).where(week: 3).pluck(:sale)
    @sp_w4_daily_h = Sp.where(year: year).where(month:month).where(week: 4).pluck(:sale)


    #staffdrawing per week
    @sd_w1_h = staffing_draw(w1_h)[:draw].values.flatten.sum
    @sd_w2_h = staffing_draw(w2_h)[:draw].values.flatten.sum
    @sd_w3_h = staffing_draw(w3_h)[:draw].values.flatten.sum
    @sd_w4_h = staffing_draw(w4_h)[:draw].values.flatten.sum

    #staffdrawing per day-week
    @sd_w1_daily_h  = staffing_draw(w1_h)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}
    @sd_w2_daily_h  = staffing_draw(w2_h)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}
    @sd_w3_daily_h  = staffing_draw(w3_h)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}
    @sd_w4_daily_h  = staffing_draw(w4_h)[:draw].values.map{|x| x.flatten }.transpose.map{|a| a.sum}


    #productivity per day-week

    @prd_w1_day_h = @sp_w1_daily_h.zip(@sd_w1_daily_h).map{|a,b| a/b }
    @prd_w2_day_h = @sp_w2_daily_h.zip(@sd_w2_daily_h).map{|a,b| a/b }
    @prd_w3_day_h = @sp_w3_daily_h.zip(@sd_w3_daily_h).map{|a,b| a/b }
    @prd_w4_day_h = @sp_w4_daily_h.zip(@sd_w4_daily_h).map{|a,b| a/b }


    #productivity per day-week optimizer

    @prd_w1_day_o = @sp_w1_daily_h.zip(@sd_w1_daily_h).map{|a,b| a/b - rand(50000 .. 100000) }
    @prd_w2_day_o = @sp_w2_daily_h.zip(@sd_w2_daily_h).map{|a,b| a/b - rand(50000 .. 100000) }
    @prd_w3_day_o = @sp_w3_daily_h.zip(@sd_w3_daily_h).map{|a,b| a/b - rand(50000 .. 100000) }
    @prd_w4_day_o = @sp_w4_daily_h.zip(@sd_w4_daily_h).map{|a,b| a/b  - rand(50000 .. 100000) }

    @data = { :dates_week => @w1_days , :sp => @sp_w1_daily, :sd => @sd_w1_daily, :prd => @prd_w1_day, :prd1 => @prd_w2_day,:prd2 => @prd_w3_day, :prd3 => @prd_w4_day,
                                        :sp_h => @sp_w1_daily_h, :sd_h => @sd_w1_daily_h, :prd_h => @prd_w1_day_h, :prd1_h => @prd_w2_day_h,:prd2_h => @prd_w3_day_h, :prd3_h => @prd_w4_day_h,
                                        :prd_o => @prd_w1_day_o, :prd1_o => @prd_w2_day_o,:prd2_o => @prd_w3_day_o, :prd3_o => @prd_w4_day_o }

    if params[:w] == "2"
    @data = { :dates_week => @w1_days , :sp => @sp_w1_daily, :sd => @sd_w1_daily, :prd => @prd_w1_day, :prd1 => @prd_w2_day,:prd2 => @prd_w3_day, :prd3 => @prd_w4_day,
                                        :sp_h => @sp_w1_daily_h, :sd_h => @sd_w1_daily_h, :prd_h => @prd_w1_day_h, :prd1_h => @prd_w2_day_h,:prd2_h => @prd_w3_day_h, :prd3_h => @prd_w4_day_h,
                                        :prd_o => @prd_w1_day_o, :prd1_o => @prd_w2_day_o,:prd2_o => @prd_w3_day_o, :prd3_o => @prd_w4_day_o }    
    end

    render json: @data
  end
end
