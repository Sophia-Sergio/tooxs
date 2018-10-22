class EfficiencyController < ApplicationController
	def index	
		@stores       = Store.all.order(:id)
		@departments  = Department.all.order(:id)
		@search = ""
		@month = params[:month] || timeNow.strftime("%m").to_i
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
        @contReal = 0

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
        realExcess = matrix_calc(@prod_obj, @totalMonth, dotReal)
        

        realExcess[:matrixSet].each_with_index do |excess, index|

            prod_w_real << (1 - ((dotReal[index] + excess).to_f / dotReal[index].to_f)).round(4) * 100
            fecha << index + 1 
        end


        #@margin_adjustment = (1 - ((excesoReal[:exceso] + excesoReal[:faltante]) / totalHour)).round(4) * 100 
        
        @data = { :fecha => fecha, :prod_w_real => prod_w_real,  :prod_w_op => prod_w_op }
        render json: @data
    end
end
