module ApplicationHelper
  def months_until(month)
    {
      1 => 'Enero',
      2 => 'Febrero',
      3 => 'Marzo',
      4 => 'Abril',
      5 => 'Mayo',
      6 => 'Junio',
      7 => 'Julio',
      8 => 'Agosto',
      9 => 'Septiembre',
      10 => 'Octubre',
      11 => 'Noviembre',
      12 => 'Diciembre'
    }.map(&:reverse).first(month)
  end

  def filter_1
    {
      stores: Store.all.pluck(:name, :id),
      departments: MasterDepartment.all.pluck(:name, :id),
      years: (2016..2018),
      months: months_until(7)
    }
  end
end
