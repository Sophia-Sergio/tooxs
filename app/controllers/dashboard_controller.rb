class DashboardController < ApplicationController
  def index

  	sellers = Seller.where(store: 1, department: 1).pluck(:assigned_shift)


  	turnos = Array.new(12, 0)


  	turnosOptimizados = [1, 1, 1, 2, 2, 1, 1, 0, 1, 5, 2, 1]



  	sellers.each do |x|
  		turnos[x] += 1
  	end

  	turnosOpTotal = turnosOptimizados.sum
  	#comparar y descontar

  	for i in 0..turnosOptimizados.length - 1
  		if (turnosOptimizados[i] > turnos[i])
  			turnosOpTotal = turnosOpTotal - (turnosOptimizados[i] - turnos[i])
  		end
  	end

  	@productividad =  ActiveSupport::NumberHelper::number_to_currency(85000,{delimiter: "."})  
  	@turnos_cubiertos = " #{turnosOpTotal} / #{turnosOptimizados.sum}"

  end

  def administracion
  end

  def ventas  	
  end
  
  def productividad
  end
end
