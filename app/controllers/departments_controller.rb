class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy]

  # GET /departments
  # GET /departments.json
  def index
    @departments = StoreDepartment.all.each_with_object({}) do |element, hash|
      hash[element.id] = {store_name: element.store.name, department_name: element.department.name}
    end
    # binding.pry
  end

  def import
    if Department.from_xlsx(params[:file].tempfile)
      flash[:notice] = 'Importado con éxito'
    else
      flash[:error] = 'Algo ha salido mal, intentalo de nuevo'
    end

    redirect_to departments_url
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
        add_breadcrumb "Dashboard", :root_path
        add_breadcrumb "Departamentos", :departments_path
        add_breadcrumb "Mostrar", :department_path
  end

  # GET /departments/new
  def new
    @department = Department.new
    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Departamentos", :departments_path
    add_breadcrumb "Crear", :new_department_path
  end

  # GET /departments/1/edit
  def edit
    add_breadcrumb "Dashboard", :root_path
    add_breadcrumb "Departamentos", :departments_path
    add_breadcrumb "Editar", :edit_department_path
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to @department, notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    respond_to do |format|
      if @department.update(department_params)
        format.html { redirect_to @department, notice: 'Department was successfully updated.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'Department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:name, :store_id)
    end
end
