class MasterDepartmentsController < ApplicationController
  before_action :set_master_department, only: [:show, :edit, :update, :destroy]

  # GET /master_departments
  # GET /master_departments.json
  def index
    @master_departments = MasterDepartment.all
  end

  # GET /master_departments/1
  # GET /master_departments/1.json
  def show
  end

  # GET /master_departments/new
  def new
    @master_department = MasterDepartment.new
  end

  # GET /master_departments/1/edit
  def edit
  end

  # POST /master_departments
  # POST /master_departments.json
  def create
    @master_department = MasterDepartment.new(master_department_params)

    respond_to do |format|
      if @master_department.save
        format.html { redirect_to @master_department, notice: 'Master department was successfully created.' }
        format.json { render :show, status: :created, location: @master_department }
      else
        format.html { render :new }
        format.json { render json: @master_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /master_departments/1
  # PATCH/PUT /master_departments/1.json
  def update
    respond_to do |format|
      if @master_department.update(master_department_params)
        format.html { redirect_to @master_department, notice: 'Master department was successfully updated.' }
        format.json { render :show, status: :ok, location: @master_department }
      else
        format.html { render :edit }
        format.json { render json: @master_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_departments/1
  # DELETE /master_departments/1.json
  def destroy
    @master_department.destroy
    respond_to do |format|
      format.html { redirect_to master_departments_url, notice: 'Master department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_master_department
      @master_department = MasterDepartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def master_department_params
      params.require(:master_department).permit(:name)
    end
end
