# frozen_string_literal: true

# Parameters used for demo only
module FilterParameters
  extend ActiveSupport::Concern

  def set_store_department
    @store_dep = StoreDepartment.find_by(
      store: params[:store], department: params[:department])
  end
end
