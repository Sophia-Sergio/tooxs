class SaleRealsController < ApplicationController

  def index
    @sale_reals = SaleReal.all
  end

  
 def index
    @sale_reals = SaleReal.all
  end

  def import
    if SaleReal.from_xlsx(params[:file].tempfile)
      flash[:notice] = 'Importado con éxito'
    else
      flash[:error] = 'Algo ha salido mal, intentalo de nuevo'
    end

    redirect_to sale_reals_url
  end

end
