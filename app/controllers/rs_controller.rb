class RsController < ApplicationController
  before_action :set_r, only: [:show, :edit, :update, :destroy]

  # GET /rs
  # GET /rs.json
  def index
    @rs = Rs.all
  end

  # GET /rs/1
  # GET /rs/1.json
  def show
  end

  # GET /rs/new
  def new
    @r = Rs.new
  end

  # GET /rs/1/edit
  def edit
  end

  # POST /rs
  # POST /rs.json
  def create
    @r = Rs.new(r_params)

    respond_to do |format|
      if @r.save
        format.html { redirect_to @r, notice: 'Rs was successfully created.' }
        format.json { render :show, status: :created, location: @r }
      else
        format.html { render :new }
        format.json { render json: @r.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rs/1
  # PATCH/PUT /rs/1.json
  def update
    respond_to do |format|
      if @r.update(r_params)
        format.html { redirect_to @r, notice: 'Rs was successfully updated.' }
        format.json { render :show, status: :ok, location: @r }
      else
        format.html { render :edit }
        format.json { render json: @r.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rs/1
  # DELETE /rs/1.json
  def destroy
    @r.destroy
    respond_to do |format|
      format.html { redirect_to rs_index_url, notice: 'Rs was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_r
      @r = Rs.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def r_params
      params.require(:r).permit(:store_id, :department_id, :date, :year, :month, :week, :dow, :nine, :ten, :eleven, :twelve, :thirteen, :fourteen, :fifteen, :sixteen, :seventeen, :eighteen, :nineteen, :twenty, :twenty_one, :twenty_two, :twenty_three, :total_day)
    end
end
