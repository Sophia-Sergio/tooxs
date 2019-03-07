module ApplicationHelper
  def day_month_format(date)
    "#{date.strftime('%d')}-#{date.strftime('%m')}"
  end

  def month_name(month)
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
    }.slice(month).values.join
  end

  def retail_parameters
    {
      stores: World.all.pluck(:name, :id),
      departments: Department.all.pluck(:name, :id),
      years: (2017..2019),
      months: {
        4 => 'Abril',
        5 => 'Mayo',
        6 => 'Junio',
        7 => 'Julio',
        8 => 'Agosto',
        9 => 'Septiembre',
        10 => 'Octubre',
        11 => 'Noviembre',
        12 => 'Diciembre'
      }
    }
  end
end
