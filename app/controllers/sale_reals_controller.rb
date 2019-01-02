class RealSalesController < ApplicationController

  def index
    @real_sales = RealSale.all
  end


 def index
    @real_sales = RealSale.all
  end

  def import
    if params[:file] != nil
      if RealSale.from_xlsx(params[:file].tempfile)
        flash[:notice] = 'Importado con éxito'
      else
        flash[:error] = 'Algo ha salido mal, intentalo de nuevo'
      end
    end
    redirect_to real_sales_url
  end

  def delete
    RealSale.delete_all
    redirect_to real_sales_url
  end

  def downloads
    send_file(
      "#{Rails.root}/public/ventas_reales_15-07-2018.xlsx",
      filename: "ventasreales.xlsx",
      type: "application/xlsx"
    )
  end
end
