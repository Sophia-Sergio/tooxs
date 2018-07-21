class SaleRealsController < ApplicationController

  def index
    @sale_reals = SaleReal.all
  end

  
 def index
    @sale_reals = SaleReal.all
  end

  def import
    if params[:file] != nil
      if SaleReal.from_xlsx(params[:file].tempfile)
        flash[:notice] = 'Importado con éxito'
      else
        flash[:error] = 'Algo ha salido mal, intentalo de nuevo'
      end
    end
    redirect_to sale_reals_url
  end

  def delete
    SaleReal.delete_all
    redirect_to sale_reals_url    
  end

  def downloads
    send_file(
      "#{Rails.root}/public/ventas_reales_15-07-2018.xlsx",
      filename: "ventasreales.xlsx",
      type: "application/xlsx"
    )
  end
end
