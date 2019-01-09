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
end
