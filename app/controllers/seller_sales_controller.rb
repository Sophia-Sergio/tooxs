class SellerSalesController < ApplicationController
  # GET /sale_by_sellers
  # GET /sale_by_sellers.json
  def index
    @sale_by_sellers = SellerSale.all
  end

  def import
    if params[:file] != nil
      if SellerSale.from_xlsx(params[:file].tempfile)
        flash[:notice] = 'Importado con éxito'
      else
        flash[:error] = 'Algo ha salido mal, intentalo de nuevo'
      end
    end
    redirect_to sale_by_sellers_url
  end
  def delete
    SellerSale.delete_all
    redirect_to sale_by_sellers_url
  end

  def downloads
    send_file(
      "#{Rails.root}/public/sale_by_sellers_15_07_2018.xlsx",
      filename: "ventasvendedor.xlsx",
      type: "application/xlsx"
    )
  end
end
