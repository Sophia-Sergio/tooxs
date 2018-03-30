class AvailableShiftsController < ApplicationController
  before_action :set_available_shift, only: [:show, :edit, :update, :destroy]

  # GET /available_shifts
  # GET /available_shifts.json
  def calendar_json
    
    @available_shift = AvailableShift.where(num: params[:num])
    @shifts = @available_shift.map do |s|
      { :id => s.id, :title => s.name, :class => 'bg-success-lighter', :start => s.date_time_shift.first, :end => s.date_time_shift.last  }
    end

    json = @shifts.to_json
    render json: json
    
  end

  def index
    @available_shifts = AvailableShift.select('DISTINCT name,num,store_id,month').order(:num) # separo por nombre / num
  end

  def import
    if AvailableShift.from_xlsx(params[:file].tempfile)
      flash[:notice] = 'Importado con éxito'
    else
      flash[:error] = 'Algo ha salido mal, intentalo de nuevo'
    end

    redirect_to available_shifts_url
  end

  # GET /available_shifts/1
  # GET /available_shifts/1.json
  def show
    @as       = AvailableShift.where(num: params[:num])
    @sellers  = Seller.where(assigned_shift: params[:num])
    @w1       = shift_week(params[:num], 1)
    @w2       = shift_week(params[:num], 2)
    @w3       = shift_week(params[:num], 3)
    @w4       = shift_week(params[:num], 4)



    @wx = 'moo'
    
  end

  # GET /available_shifts/new
  def new
    @available_shift = AvailableShift.new
  end

  # GET /available_shifts/1/edit
  def edit
  end

  # POST /available_shifts
  # POST /available_shifts.json
  def create
    @available_shift = AvailableShift.new(available_shift_params)

    respond_to do |format|
      if @available_shift.save
        format.html { redirect_to @available_shift, notice: 'Available shift was successfully created.' }
        format.json { render :show, status: :created, location: @available_shift }
      else
        format.html { render :new }
        format.json { render json: @available_shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /available_shifts/1
  # PATCH/PUT /available_shifts/1.json
  def update
    respond_to do |format|
      if @available_shift.update(available_shift_params)
        format.html { redirect_to @available_shift, notice: 'Available shift was successfully updated.' }
        format.json { render :show, status: :ok, location: @available_shift }
      else
        format.html { render :edit }
        format.json { render json: @available_shift.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /available_shifts/1
  # DELETE /available_shifts/1.json
  def destroy
    @available_shift.destroy
    respond_to do |format|
      format.html { redirect_to available_shifts_url, notice: 'Available shift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_available_shift
      @available_shift = AvailableShift.find_by(num: params[:num])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def available_shift_params
      params.require(:available_shift).permit(:store_id, :num, :name, :month, :week, :day, :nine, :ten, :eleven, :twelve, :thirteen, :fourteen, :fifteen, :sixteen, :seventeen, :eighteen, :nineteen, :twenty, :twenty_one, :twenty_two, :twenty_three, :twenty_four)
    end

    def shift_week(num,week)

      @hours  = []
      (9..24).each { |i| @hours << i }

      @days  = []
      (1..7).each { |i| @days << i }

      @cols = ['nine','ten','eleven','twelve','thirteen','fourteen','fifteen','sixteen','seventeen','eighteen','nineteen','twenty','twenty_one','twenty_two','twenty_three','twenty_four']

      @as = AvailableShift.where(num: params[:num], week:week)

      nine         = []
      ten          = []
      eleven       = []
      twelve       = []
      thirteen     = []
      fourteen     = []
      fifteen      = []
      sixteen      = []
      seventeen    = []
      eighteen     = []
      nineteen     = []
      twenty       = []
      twenty_one   = []
      twenty_two   = []
      twenty_three = []
      twenty_four  = []
     
      @as.each do |d| 
        @cols.each do |v| 
          eval(v) << d.public_send( v.to_sym )
        end
      end

      @shift = {
       '09:00' => nine,
       '10:00' => ten,
       '11:00' => eleven,
       '12:00' => twelve,
       '13:00' => thirteen,
       '14:00' => fourteen,
       '15:00' => fifteen,
       '16:00' => sixteen,
       '17:00' => seventeen,
       '18:00' => eighteen,
       '19:00' => nineteen,
       '20:00' => twenty,
       '21:00' => twenty_one,
       '22:00' => twenty_two,
       '23:00' => twenty_three,
       '00:00' => twenty_four
      }
    end
end
