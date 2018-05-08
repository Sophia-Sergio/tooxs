class StaffingCasesController < ApplicationController
  before_action :set_staffing_case, only: [:show, :edit, :update, :destroy]

  # GET /staffing_cases
  # GET /staffing_cases.json
  def index
    @staffing_cases = StaffingCase.all
  end

  # GET /staffing_cases/1
  # GET /staffing_cases/1.json
  def show
  end

  # GET /staffing_cases/new
  def new
    @staffing_case = StaffingCase.new
  end

  # GET /staffing_cases/1/edit
  def edit
  end

  # POST /staffing_cases
  # POST /staffing_cases.json
  def create
    @staffing_case = StaffingCase.new(staffing_case_params)

    respond_to do |format|
      if @staffing_case.save
        format.html { redirect_to @staffing_case, notice: 'Staffing case was successfully created.' }
        format.json { render :show, status: :created, location: @staffing_case }
      else
        format.html { render :new }
        format.json { render json: @staffing_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /staffing_cases/1
  # PATCH/PUT /staffing_cases/1.json
  def update
    respond_to do |format|
      if @staffing_case.update(staffing_case_params)
        format.html { redirect_to @staffing_case, notice: 'Staffing case was successfully updated.' }
        format.json { render :show, status: :ok, location: @staffing_case }
      else
        format.html { render :edit }
        format.json { render json: @staffing_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staffing_cases/1
  # DELETE /staffing_cases/1.json
  def destroy
    @staffing_case.destroy
    respond_to do |format|
      format.html { redirect_to staffing_cases_url, notice: 'Staffing case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_staffing_case
      @staffing_case = StaffingCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def staffing_case_params
      params.require(:staffing_case).permit(:id_case, :tolerance, :actual_staffing_eval, :max_time, :user)
    end
end
