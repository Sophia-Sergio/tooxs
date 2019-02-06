module Api
  module V1
    # only employees endpoints
    class FiltersController < ApplicationController
      include FilterParameters
      before_action :set_store

      def compared_stores
        render json: {
          stores: @store.stores_same_department(params[:department]).as_json(only: [:id, :name])
        }
      end
    end
  end
end