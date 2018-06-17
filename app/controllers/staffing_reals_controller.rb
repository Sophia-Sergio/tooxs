class StaffingRealsController < ApplicationController
  before_action :set_staffing_real, only: [:show, :edit, :update, :destroy]

  # GET /staffing_reals
  # GET /staffing_reals.json
  def index
    @staffing_reals = StaffingReal.all
  end

  # GET /staffing_reals/1
  # GET /staffing_reals/1.json
  def show
  end

  # GET /staffing_reals/new
  def new
    @staffing_real = StaffingReal.new
  end

  # GET /staffing_reals/1/edit
  def edit
  end

  # POST /staffing_reals
  # POST /staffing_reals.json
  def create
    @staffing_real = StaffingReal.new(staffing_real_params)

    respond_to do |format|
      if @staffing_real.save
        format.html { redirect_to @staffing_real, notice: 'Staffing real was successfully created.' }
        format.json { render :show, status: :created, location: @staffing_real }
      else
        format.html { render :new }
        format.json { render json: @staffing_real.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staffing_reals/1
  # PATCH/PUT /staffing_reals/1.json
  def update
    respond_to do |format|
      if @staffing_real.update(staffing_real_params)
        format.html { redirect_to @staffing_real, notice: 'Staffing real was successfully updated.' }
        format.json { render :show, status: :ok, location: @staffing_real }
      else
        format.html { render :edit }
        format.json { render json: @staffing_real.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffing_reals/1
  # DELETE /staffing_reals/1.json
  def destroy
    @staffing_real.destroy
    respond_to do |format|
      format.html { redirect_to staffing_reals_url, notice: 'Staffing real was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staffing_real
      @staffing_real = StaffingReal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staffing_real_params
      params.require(:staffing_real).permit(:seller, :date, :hour, :department)
    end
end
