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

  def retail_parameters
    {
      stores: Store.all.pluck(:name, :id),
      departments: MasterDepartment.all.pluck(:name, :id),
      years: (2016..2018),
      months: months_until(7)
    }
  end

  def market_parameters
    {
      name: 'Tottus Kennedy',
      stores: [['Supermercado 1', 1], ['Supermercado 2', 2], ['Supermercado 3', 3]],
      departments: [['Todos', 1], ['Abarrotes', 2], ['Bebidas', 2], ['Frutas y Verduras', 3]],
      production_departments: [['Todos', 1 ], ['Carnes', 2], ['Fiambrería y Quesos', 3], ['Pescados y Mariscos', 4]],
      years: (2016..2018),
      months: months_until(7)
    }
  end
end
