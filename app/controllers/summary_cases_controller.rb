class SummaryCasesController < ApplicationController
  before_action :set_summary_case, only: [:show, :edit, :update, :destroy]

  # GET /summary_cases
  # GET /summary_cases.json
  def index
    @summary_cases = SummaryCase.all
  end

  # GET /summary_cases/1
  # GET /summary_cases/1.json
  def show
  end

  # GET /summary_cases/new
  def new
    @summary_case = SummaryCase.new
  end

  # GET /summary_cases/1/edit
  def edit
  end

  # POST /summary_cases
  # POST /summary_cases.json
  def create
    @summary_case = SummaryCase.new(summary_case_params)

    respond_to do |format|
      if @summary_case.save
        format.html { redirect_to @summary_case, notice: 'Summary case was successfully created.' }
        format.json { render :show, status: :created, location: @summary_case }
      else
        format.html { render :new }
        format.json { render json: @summary_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /summary_cases/1
  # PATCH/PUT /summary_cases/1.json
  def update
    respond_to do |format|
      if @summary_case.update(summary_case_params)
        format.html { redirect_to @summary_case, notice: 'Summary case was successfully updated.' }
        format.json { render :show, status: :ok, location: @summary_case }
      else
        format.html { render :edit }
        format.json { render json: @summary_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /summary_cases/1
  # DELETE /summary_cases/1.json
  def destroy
    @summary_case.destroy
    respond_to do |format|
      format.html { redirect_to summary_cases_url, notice: 'Summary case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_summary_case
      @summary_case = SummaryCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def summary_case_params
      params.require(:summary_case).permit(:id_case, :sale_plan, :coverange_deficit, :surplus_coverange, :total_deviation, :cost_of_remunerations, :margin_adjustment, :type_io, :real_dot)
    end
end
