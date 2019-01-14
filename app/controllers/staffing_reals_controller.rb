class StaffingRealsController < ApplicationController

  # GET /staffing_reals
  # GET /staffing_reals.json
  def index
    # @staffing_reals = RealStaff.all
  end

  # GET /staffing_reals/1
  # GET /staffing_reals/1.json
  def show
  end

  # GET /staffing_reals/new
  def new
    # @staffing_real = RealStaff.new
  end

  # GET /staffing_reals/1/edit
  def edit
  end

  # POST /staffing_reals
  # POST /staffing_reals.json
  def create
    # @staffing_real = RealStaff.new(staffing_real_params)
    #
    # respond_to do |format|
    #   if @staffing_real.save
    #     format.html { redirect_to @staffing_real, notice: 'Staffing real was successfully created.' }
    #     format.json { render :show, status: :created, location: @staffing_real }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @staffing_real.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /staffing_reals/1
  # PATCH/PUT /staffing_reals/1.json
  def update
    # respond_to do |format|
    #   if @staffing_real.update(staffing_real_params)
    #     format.html { redirect_to @staffing_real, notice: 'Staffing real was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @staffing_real }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @staffing_real.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def import
    # if params[:file] != nil
    #   if RealStaff.from_xlsx(params[:file].tempfile)
    #     flash[:notice] = 'Importado con éxito'
    #   else
    #     flash[:error] = 'Algo ha salido mal, intentalo de nuevo'
    #   end
    # end
    # redirect_to staffing_reals_url
  end

  def downloads
    # send_file(
    #   "#{Rails.root}/public/2018-09-15_staffing_reals_import.xlsx",
    #   filename: "staffing_reals.xlsx",
    #   type: "application/xlsx"
    # )
  end


  def delete
    # RealStaff.delete_all
    # redirect_to staffing_reals_url
  end

  # DELETE /staffing_reals/1
  # DELETE /staffing_reals/1.json
  def destroy
    # @staffing_real.destroy
    # respond_to do |format|
    #   format.html { redirect_to staffing_reals_url, notice: 'Staffing real was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  # private
    # Use callbacks to share common setup or constraints between actions.
    # def set_staff_real
    #   @staffing_real = RealStaff.find(params[:id])
    # end
    #
    # # Never trust parameters from the scary internet, only allow the white list through.
    # def staffing_real_params
    #   params.require(:staffing_real).permit(:store_id, :department_id, :year, :month, :day, :staff_number)
    # end
end
