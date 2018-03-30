class ShiftBreaksController < ApplicationController
  before_action :set_shift_break, only: [:show, :edit, :update, :destroy]

  # GET /shift_breaks
  # GET /shift_breaks.json
  def index
    @shift_breaks = ShiftBreak.all
  end

  # GET /shift_breaks/1
  # GET /shift_breaks/1.json
  def show
  end

  # GET /shift_breaks/new
  def new
    @shift_break = ShiftBreak.new
  end

  # GET /shift_breaks/1/edit
  def edit
  end

  # POST /shift_breaks
  # POST /shift_breaks.json
  def create
    @shift_break = ShiftBreak.new(shift_break_params)

    respond_to do |format|
      if @shift_break.save
        format.html { redirect_to @shift_break, notice: 'Shift break was successfully created.' }
        format.json { render :show, status: :created, location: @shift_break }
      else
        format.html { render :new }
        format.json { render json: @shift_break.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shift_breaks/1
  # PATCH/PUT /shift_breaks/1.json
  def update
    respond_to do |format|
      if @shift_break.update(shift_break_params)
        format.html { redirect_to @shift_break, notice: 'Shift break was successfully updated.' }
        format.json { render :show, status: :ok, location: @shift_break }
      else
        format.html { render :edit }
        format.json { render json: @shift_break.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shift_breaks/1
  # DELETE /shift_breaks/1.json
  def destroy
    @shift_break.destroy
    respond_to do |format|
      format.html { redirect_to shift_breaks_url, notice: 'Shift break was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shift_break
      @shift_break = ShiftBreak.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shift_break_params
      params.require(:shift_break).permit(:seller_id, :date, :time)
    end
end
