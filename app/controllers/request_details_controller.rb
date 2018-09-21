class RequestDetailsController < ApplicationController
  before_action :set_request_detail, only: [:show, :edit, :update, :destroy]

  # GET /request_details
  # GET /request_details.json
  def index
    @request_details = RequestDetail.all
  end

  # GET /request_details/1
  # GET /request_details/1.json
  def show
  end

  # GET /request_details/new
  def new
    @request_detail = RequestDetail.new
  end

  # GET /request_details/1/edit
  def edit
  end

  # POST /request_details
  # POST /request_details.json
  def create
    @request_detail = RequestDetail.new(request_detail_params)

    respond_to do |format|
      if @request_detail.save
        format.html { redirect_to @request_detail, notice: 'Request detail was successfully created.' }
        format.json { render :show, status: :created, location: @request_detail }
      else
        format.html { render :new }
        format.json { render json: @request_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /request_details/1
  # PATCH/PUT /request_details/1.json
  def update
    respond_to do |format|
      if @request_detail.update(request_detail_params)
        format.html { redirect_to @request_detail, notice: 'Request detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @request_detail }
      else
        format.html { render :edit }
        format.json { render json: @request_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /request_details/1
  # DELETE /request_details/1.json
  def destroy
    @request_detail.destroy
    respond_to do |format|
      format.html { redirect_to request_details_url, notice: 'Request detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request_detail
      @request_detail = RequestDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_detail_params
      params.require(:request_detail).permit(:request_id, :department_id, :turn, :quantity, :rrhh, :internal, :laborum, :trabajando)
    end
end
