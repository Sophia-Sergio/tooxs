class AssignedShiftController < ApplicationController
  def show
  	@as 	= AvailableShift.where(num: params[:num]).first
  	@seller	= Seller.find(params[:seller_id])

  	@shifts	= AvailableShift.code(params[:num])

  	begin_shift_day = @seller.begin_shift.strftime('%u').to_i

  	@shift_dates = []

  	(@seller.begin_shift..@seller.begin_shift+12.months).each do |i|
  		@shift_dates << i	
  	end
  	
  	@shift_days = []
    
  	@shifts.each do |d|
  		@shift_days << [d.shift, d.week, d.day]
  	end

    #generar turno en base al dia de inicio.
  	@t = []

  	i = begin_shift_day

    (1..366).each do |v|
      @t << [@shift_dates[v-1] , @shift_days[i-1] ]
      i = i + 1
      if i > 28
        i = 1
      end
    end

  end
end
