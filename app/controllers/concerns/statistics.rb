# frozen_string_literal: true

# Parameters used for demo only
module Statistics
  extend ActiveSupport::Concern

  def self.seller_shifts(store_department, params)
    {
      optimized: store_department.optimized_shifts(params),
      actual: store_department.actual_shifts(params)
    }
  end

  def self.efficiency_graph(params)
    date_start = month_start(params[:year_start], params[:month_start])
    date_end = month_end(params[:year_end], params[:month_end])
    achievements = Achievement.productivity_rate(date_start, date_end)
    {
      labels: achievements.keys.map { |date| "#{date.strftime('%d')}-#{date.strftime('%m')}" },
      datasets: [
        {
          label: 'Eficiencia Real',
          data: achievements.values
        },
        {
          label: 'Eficiencia Óptima',
          data: achievements.values
        }
      ]
    }
  end
end
