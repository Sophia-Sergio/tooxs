class Seller < ApplicationRecord
  belongs_to :store
  belongs_to :department
  has_many :available_shift, foreign_key: 'num', primary_key: 'assigned_shift'

  validates_presence_of :rut, :name, :lastname, :email, :phone, :number, :city,
                        :country



  def fullname
    self.name+' '+self.lastname
  end

  def my_shift
    #@seller = Seller.find(params[:seller_id])

    @shifts = AvailableShift.code(self.assigned_shift)
    begin_shift_day = self.begin_shift.strftime('%u').to_i
    @shift_dates = []

    (self.begin_shift..self.begin_shift+12.months).each do |i|
      @shift_dates << i.strftime("%Y%m%d")
    end
    
    @shift_days = []
    
    @shifts.each do |d|
      @shift_days << [d.shift, d.week, d.day]
    end

    #generar turno en base al dia de inicio.
    @t = []

    i = begin_shift_day

    (1..366).each do |v|
      @t << [@shift_dates[v-1] , @shift_days[i-1] ]
      i = i + 1
      if i > 28
        i = 1
      end
    end
    @x = @t.map { |x| x.flatten }

    return @x
  end

  def my_days_off
    @shift = self.my_shift
    @do = {}

    @shift.each do |d| 
      if d[1] == "0:00"

        year  = d[0][0,4]
        month = d[0][4,2]
        day   = d[0][6,2]
        @do[year] = {} if @do[year].nil? 
        @do[year][month] = [] if @do[year][month].nil?
        
        @do[year][month] << d
      end
    end

    return @do

  end

  #importacion
  class << self
    def from_xlsx(file = '')
      return if file.blank?
      worksheet = RubyXL::Parser.parse(file)[0]

      worksheet.each_with_index do |row, i|
        next if i.zero?
        values = []
        row && row.cells.each do |cell|
          val = cell && cell.value
          values << val
        end
        import_row(values)
      end
    end

    private

    def import_row(row)

      puts row

      store = Store.find(row[11])
      return if store.nil?

      department = Department.find_by_origin_id(row[12])
      return if department.nil?

      seller = Seller.find_or_initialize_by(rut: row[0])
      seller.update_attributes(
        name: row[1],
        lastname: row[2],
        email: row[3],
        phone: row[4],
        street: row[5],
        number: row[6],
        city: row[7],
        district: row[8],
        county: row[9],
        country: row[10],
        store_id: store.id,
        department_id: department.id,
        assigned_shift: row[13],
        begin_shift: row[14]
      )
    end
  end
end
