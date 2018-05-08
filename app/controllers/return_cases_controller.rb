class ReturnCasesController < ApplicationController
  before_action :set_return_case, only: [:show, :edit, :update, :destroy]

  # GET /return_cases
  # GET /return_cases.json
  def index
    @return_cases = ReturnCase.all
  end

  # GET /return_cases/1
  # GET /return_cases/1.json
  def show
  end

  # GET /return_cases/new
  def new
    @return_case = ReturnCase.new
  end

  # GET /return_cases/1/edit
  def edit
  end

  # POST /return_cases
  # POST /return_cases.json
  def create
    @return_case = ReturnCase.new(return_case_params)

    respond_to do |format|
      if @return_case.save
        format.html { redirect_to @return_case, notice: 'Return case was successfully created.' }
        format.json { render :show, status: :created, location: @return_case }
      else
        format.html { render :new }
        format.json { render json: @return_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /return_cases/1
  # PATCH/PUT /return_cases/1.json
  def update
    respond_to do |format|
      if @return_case.update(return_case_params)
        format.html { redirect_to @return_case, notice: 'Return case was successfully updated.' }
        format.json { render :show, status: :ok, location: @return_case }
      else
        format.html { render :edit }
        format.json { render json: @return_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /return_cases/1
  # DELETE /return_cases/1.json
  def destroy
    @return_case.destroy
    respond_to do |format|
      format.html { redirect_to return_cases_url, notice: 'Return case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_return_case
      @return_case = ReturnCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def return_case_params
      params.require(:return_case).permit(:id_case, :eff_margin, :total_surplus, :compensation_cost, :integer, :status, :user, :message, :deficit_total, :tolerance, :version, :format_result, :max_time, :lunchs, :turns, :delta, :epsilon, :support, :model, :sales_plan, :obj_function)
    end
end
