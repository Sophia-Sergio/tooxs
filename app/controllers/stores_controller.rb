class StoresController < ApplicationController
  # before_action :set_store, only: [:show, :edit, :update, :destroy]

  # GET /stores
  # GET /stores.json
  def index
    # @stores = Store.all
    # add_breadcrumb "Dashboard", :root_path
    # add_breadcrumb "Tiendas", :stores_path
  end

  def import
    # if Store.from_xlsx(params[:file].tempfile)
    #   flash[:notice] = 'Importado con éxito'
    # else
    #   flash[:error] = 'Algo ha salido mal, intentalo de nuevo'
    # end
    #
    # redirect_to stores_url
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    # add_breadcrumb "Dashboard", :root_path
    # add_breadcrumb "Tiendas", :stores_path
    # add_breadcrumb "Mostrar", :store_path
  end

  # GET /stores/new
  def new
    # @store = Store.new
    # add_breadcrumb "Dashboard", :root_path
    # add_breadcrumb "Tiendas", :stores_path
    # add_breadcrumb "crear", :new_store_path
  end

  # GET /stores/1/edit
  def edit
    # add_breadcrumb "Dashboard", :root_path
    # add_breadcrumb "Tiendas", :stores_path
    # add_breadcrumb "Editar", :edit_store_path
  end

  # POST /stores
  # POST /stores.json
  def create
    # @store = Store.new(store_params)
    #
    # respond_to do |format|
    #   if @store.save
    #     format.html { redirect_to @store, notice: 'Store was successfully created.' }
    #     format.json { render :show, status: :created, location: @store }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @store.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    # respond_to do |format|
    #   if @store.update(store_params)
    #     format.html { redirect_to @store, notice: 'Store was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @store }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @store.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    # @store.destroy
    # respond_to do |format|
    #   format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_store
  #     @store = Store.find(params[:id])
  #   end
  #
  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def store_params
  #     params.require(:store).permit(
  #       :name,
  #       :street,
  #       :number,
  #       :city,
  #       :district,
  #       :county,
  #       :country,
  #       :size,
  #       :economic_segment
  #     )
  #   end
end