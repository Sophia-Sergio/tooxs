# frozen_string_literal: true

# Parameters used for demo only
module DemoParameters
  extend ActiveSupport::Concern

  def demo_data
    {
      department: 1,
      store:      1,
      search:     '',
      date:       Date.new(2018, 6, 24)
    }
  end
end
