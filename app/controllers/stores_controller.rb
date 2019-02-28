class StoresController < ApplicationController
  before_action :set_store, only: [show, edit]

  def index
    @stores = Store.all
  end

  def show() end
end
