class DashboardController < ApplicationController
	def index

		department = 1
		store = 1

		@sellers = Seller.where(store: store, department: department)

		year = Date.today.strftime("%Y").to_i
        month = Date.today.strftime("%m").to_i


		assigned_shift = Seller.where(store: 1, department: 1).pluck(:assigned_shift)
		turnos = Array.new(12, 0)

		dataCase = DataCase.where(dep_num: department, month: month).first
		summaryCase = SummaryCase.where( id_case: dataCase.id_case, type_io: 'out').first
		
		turnosOptimizados = [1, 1, 1, 2, 2, 1, 1, 0, 1, 5, 2, 1]
		
		assigned_shift.each do |x|
			turnos[x] += 1
		end

		turnosOpTotal = turnosOptimizados.sum
		#comparar y descontar

		for i in 0..turnosOptimizados.length - 1
			if (turnosOptimizados[i] > turnos[i])
				turnosOpTotal = turnosOpTotal - (turnosOptimizados[i] - turnos[i])
			end
		end

		@productividad =  ActiveSupport::NumberHelper::number_to_currency(63665,{delimiter: "."})  
		@turnos_cubiertos = " #{turnosOpTotal} / #{turnosOptimizados.sum}"

		add_breadcrumb "Dashboard", :root_path
	end

	def sale_real(seller, year, month)

		@store        = seller.store.id
		@dep          = seller.department.id

		@year         = year #params[:year]    
		@month        = month #params[:month]

		beginning_of_month = "#{@year}-#{@month}-01".to_date
		end_of_month = beginning_of_month.end_of_month
		week_start = beginning_of_month.strftime("%V")
		week_end   = end_of_month.strftime("%V")

		#week fix if is last week of the year on first month
		week_start = '01' if week_start.to_i == 53  

		result = []
		(week_start..week_end).each do |w| 
			@week = w
			@real_week = SaleReal.where(week: @week, :store => @store, :department => @dep, year: @year)
			@real_total_month  = SaleReal.where(year: @year, month: @month, :store => @store, :department => @dep).group(:month).order(:month).sum("nine+ten+eleven+twelve+thirteen+fourteen+fifteen+sixteen+seventeen+eighteen+nineteen+twenty+twenty_one+twenty_two+twenty_three+twenty_four")
			@year_plus_one = @year + 1
			@dates_week = []
			@dates_week_2 = []
			
			(1..7).each do |i|
				@dates_week << Date.commercial(@year.to_i,@week.to_i,i).strftime('%d-%m-%Y')
				@dates_week_2 << ( Date.commercial(@year_plus_one,@week.to_i,i)).strftime('%Y%m%d')
			end  

			nine = []
			ten = []
			eleven = []
			twelve = []
			thirteen = []
			fourteen = []
			fifteen = []
			sixteen = []
			seventeen = []
			eighteen = []
			nineteen = []
			twenty = []
			twenty_one = []
			twenty_two = []
			twenty_three = []
			twenty_four = []

			@real_week.each do |s|
				nine << (s.nine.to_i).to_f
				ten << (s.ten.to_i).to_f
				eleven << (s.eleven.to_i).to_f
				twelve << (s.twelve.to_i).to_f
				thirteen << (s.thirteen.to_i).to_f
				fourteen << (s.fourteen.to_i).to_f
				fifteen << (s.fifteen.to_i).to_f
				sixteen << (s.sixteen.to_i).to_f
				seventeen << (s.seventeen.to_i).to_f
				eighteen << (s.eighteen.to_i).to_f
				nineteen << (s.nineteen.to_i).to_f
				twenty << (s.twenty.to_i).to_f
				twenty_one << (s.twenty_one.to_i).to_f
				twenty_two << (s.twenty_two.to_i).to_f
				twenty_three << (s.twenty_three.to_i).to_f
				twenty_four << (s.twenty_four.to_i).to_f
			end

			week = 
			{
				'09:00' => nine,
				'10:00' => ten,
				'11:00' => eleven,
				'12:00' => twelve,
				'13:00' => thirteen,
				'14:00' => fourteen,
				'15:00' => fifteen,
				'16:00' => sixteen,
				'17:00' => seventeen,
				'18:00' => eighteen,
				'19:00' => nineteen,
				'20:00' => twenty,
				'21:00' => twenty_one,
				'22:00' => twenty_two,
				'23:00' => twenty_three,
				'00:00' => twenty_four
			}


			staffing_week = staffing_draw(@dates_week_2[0].to_i)
		end
		return result
	end 
end
