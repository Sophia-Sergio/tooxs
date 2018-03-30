class HistoricSalesController < ApplicationController
  def index
    @historic_sales = HistoricSale.all
  end

  def import
    if HistoricSale.from_xlsx(params[:file].tempfile)
      flash[:notice] = 'Importado con éxito'
    else
      flash[:error] = 'Algo ha salido mal, intentalo de nuevo'
    end

    redirect_to historic_sales_url
  end
end
