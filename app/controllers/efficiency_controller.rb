class EfficiencyController < ApplicationController
    include DemoParameters

	def index	
		@stores       = Store.all.order(:id)
		@departments  = Department.all.order(:id)
		@search = ""
		@month = params[:month] || demo_data[:date].month
	end

    def report

        @department = params[:department]
        @store = params[:store]
        @year = params[:year]
        @month = params[:month]
        prod_w_real = []
        fecha = []
        prod_w_op = [55, 18, 25]
        


        dataCase = DataCase.where(dep_num: @department, month: @month).first
        @prod_obj = dataCase.prod_obj.to_f

        #obtener ventas reales del mes 
        sale_reals = SaleReal.where(department_id: @department, store_id: @store, year: @year, month: @month) 
        @realMonth = []
        @totalMonth = []
        @totalOpMonth = []
        @opMonth = []
        @contReal = 0
        @contOp = 0

        #obtener productividad real
        dotReal = dotacion_real(@department, @month, @year)
        
        if dotReal.length > 0
            sale_reals.each do |sale|
                totalRealDay = sale[:nine]+sale[:ten]+sale[:eleven]+sale[:twelve]+sale[:thirteen]+sale[:fourteen]+sale[:fifteen]+sale[:sixteen]+sale[:seventeen]+sale[:eighteen]+sale[:nineteen]+sale[:twenty]+sale[:twenty_one]+sale[:twenty_two]+sale[:twenty_three]+sale[:twenty_four]
                @realMonth  << totalRealDay
                @totalMonth << (totalRealDay.to_f / dotReal[@contReal]).round
                @contReal += 1            
            end
        end

        # excess of hours with real endowment
        realExcess = matrix_calc(@prod_obj, @totalMonth, dotReal)     
        realExcess[:matrixSet].each_with_index do |excess, index|
            
            percentDesviation = (((dotReal[index] + excess).to_f / dotReal[index].to_f)).round(4) * 100

            if percentDesviation > 100
                
                prod_w_real << 100 - ( percentDesviation - 100)

            elsif percentDesviation < 100 and percentDesviation > 0
                
                prod_w_real << percentDesviation 

            else
                prod_w_real << percentDesviation                
            end

            fecha << index + 1 
        end


        # excess hours with optimized endowment
        @brain_json = brain_json(@month, @year, @store, @department)          
        @plan = JSON.parse(@brain_json)
        dotacion_op = cerebro_sumatoria_turnos_optimizado(@brain_json, dataCase[:id_case])


        if dotacion_op.length > 0
            sale_reals.each do |sale|
                totalRealDay = sale[:nine]+sale[:ten]+sale[:eleven]+sale[:twelve]+sale[:thirteen]+sale[:fourteen]+sale[:fifteen]+sale[:sixteen]+sale[:seventeen]+sale[:eighteen]+sale[:nineteen]+sale[:twenty]+sale[:twenty_one]+sale[:twenty_two]+sale[:twenty_three]+sale[:twenty_four]
                @opMonth  << totalRealDay
                @totalOpMonth << (totalRealDay.to_f / dotacion_op[@contOp]).round
                @contOp += 1            
            end
        end


        opExcess = matrix_calc(@prod_obj, @totalOpMonth, dotacion_op)     
        opExcess[:matrixSet].each_with_index do |excess, index|

            percentDesviation = (((dotacion_op[index] + excess).to_f / dotacion_op[index].to_f)).round(4) * 100
            
            if percentDesviation > 100
                
                prod_w_op << 100 - ( percentDesviation - 100)

            elsif percentDesviation < 100 and percentDesviation > 0
                
                prod_w_op << percentDesviation 

            else
                prod_w_op << percentDesviation                
            end

        end

        @data = { :fecha => fecha, :prod_w_real => prod_w_real,  :prod_w_op => prod_w_op }
        render json: @data
    end

end
