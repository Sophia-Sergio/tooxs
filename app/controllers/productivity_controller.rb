class ProductivityController < ApplicationController
  
  def show
  	@search       = ''
    @stores       = Store.all.order(:id)
    @departments  = Department.all.order(:id)

    month = 2
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

    #productivity per week-month
    #@prd_w1 = (@sp_w1 / @sd_w1)
    #@prd_w2 = (@sp_w2 / @sd_w2)
    #@prd_w3 = (@sp_w3 / @sd_w3)
    #@prd_w4 = (@sp_w4 / @sd_w4)
    

    #binding.pry
  end

  def json_current

    #dummy demo data
    month = 2
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


    @data = { :dates_week => @w1_days , :sp => @sp_w1_daily, :sd => @sd_w1_daily, :prd => @prd_w1_day }

    if params[:w] == "2"
        @data = { :dates_week => @w1_days , :sp => @sp_w1_daily, :sd => @sd_w2_daily, :prd => @prd_w2_day }
    end

    render json: @data
  end
end
