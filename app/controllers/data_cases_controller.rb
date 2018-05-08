class DataCasesController < ApplicationController
  before_action :set_data_case, only: [:show, :edit, :update, :destroy]

  # GET /data_cases
  # GET /data_cases.json
  def index
    @data_cases = DataCase.all
  end

  # GET /data_cases/1
  # GET /data_cases/1.json
  def show
  end

  # GET /data_cases/new
  def new
    @data_case = DataCase.new
  end

  # GET /data_cases/1/edit
  def edit
  end

  # POST /data_cases
  # POST /data_cases.json
  def create
    @data_case = DataCase.new(data_case_params)

    respond_to do |format|
      if @data_case.save
        format.html { redirect_to @data_case, notice: 'Data case was successfully created.' }
        format.json { render :show, status: :created, location: @data_case }
      else
        format.html { render :new }
        format.json { render json: @data_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data_cases/1
  # PATCH/PUT /data_cases/1.json
  def update
    respond_to do |format|
      if @data_case.update(data_case_params)
        format.html { redirect_to @data_case, notice: 'Data case was successfully updated.' }
        format.json { render :show, status: :ok, location: @data_case }
      else
        format.html { render :edit }
        format.json { render json: @data_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data_cases/1
  # DELETE /data_cases/1.json
  def destroy
    @data_case.destroy
    respond_to do |format|
      format.html { redirect_to data_cases_url, notice: 'Data case was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_data_case
      @data_case = DataCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def data_case_params
      params.require(:data_case).permit(:id_case, :turn_num, :dep_num, :day_num, :hour_day, :hp_val, :prod_obj, :vhp, :pov, :luch_in, :lunch_hours, :hour_min, :turns_matrix, :real_dot, :sale_plan)
    end
end
