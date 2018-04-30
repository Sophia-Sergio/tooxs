class SaleBySellersController < ApplicationController
  before_action :set_sale_by_seller, only: [:show, :edit, :update, :destroy]

  # GET /sale_by_sellers
  # GET /sale_by_sellers.json
  def index
    @sale_by_sellers = SaleBySeller.all
  end

  # GET /sale_by_sellers/1
  # GET /sale_by_sellers/1.json
  def show
  end

  # GET /sale_by_sellers/new
  def new
    @sale_by_seller = SaleBySeller.new
  end

  # GET /sale_by_sellers/1/edit
  def edit
  end

  # POST /sale_by_sellers
  # POST /sale_by_sellers.json
  def create
    @sale_by_seller = SaleBySeller.new(sale_by_seller_params)

    respond_to do |format|
      if @sale_by_seller.save
        format.html { redirect_to @sale_by_seller, notice: 'Sale by seller was successfully created.' }
        format.json { render :show, status: :created, location: @sale_by_seller }
      else
        format.html { render :new }
        format.json { render json: @sale_by_seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sale_by_sellers/1
  # PATCH/PUT /sale_by_sellers/1.json
  def update
    respond_to do |format|
      if @sale_by_seller.update(sale_by_seller_params)
        format.html { redirect_to @sale_by_seller, notice: 'Sale by seller was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale_by_seller }
      else
        format.html { render :edit }
        format.json { render json: @sale_by_seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale_by_sellers/1
  # DELETE /sale_by_sellers/1.json
  def destroy
    @sale_by_seller.destroy
    respond_to do |format|
      format.html { redirect_to sale_by_sellers_url, notice: 'Sale by seller was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_by_seller
      @sale_by_seller = SaleBySeller.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_by_seller_params
      params.require(:sale_by_seller).permit(:seller, :month, :week, :day, :time, :store_id, :sale, :turn, :year)
    end
end
