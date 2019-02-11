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
      10 => 'Ocutbre',
      11 => 'Noviembre',
      12 => 'Diciembre'
    }.slice(month).values.join
  end
end
