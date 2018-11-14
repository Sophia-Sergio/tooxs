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
      departments: Department.all.pluck(:name, :id),
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

  def dashboard_links
    {
      falabella: root_path,
      sodimac: sodimac_dashboard_index_path,
      tottus: tottus_dashboard_index_path
    }
  end

  def all_brands_links
    {
      falabella: '#',
      sodimac: '#',
      tottus: '#'
    }
  end

  def all_brands_controllers
    %w[sales sales_cluster sellers config staffing productivity hour_analysis
       productivity_cluster efficiency staff_request]
  end

  def falabella_controllers
    %w[dashboard]
  end

  def sodimac_controllers
    %w[sodimac/dashboard]
  end

  def tottus_controllers
    %w[tottus/dashboard]
  end

  def all_active
    'active' if all_brands_controllers.include? params[:controller]
  end

  def falabella_active
    return 'active' if falabella_controllers.include?(params[:controller]) || params[:type] == 'falabella'

    all_active if params[:action] != 'staffing_store'
  end

  def sodimac_active
    'active' if sodimac_controllers.include?(params[:controller]) || params[:type] == 'sodimac'
  end

  def tottus_active
    'active' if tottus_controllers.include? params[:controller]
  end

  def link_options
    return all_brands_links if all_brands_controllers.include? params[:controller]

    dashboard_links
  end
end
