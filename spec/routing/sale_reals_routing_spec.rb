require "rails_helper"

RSpec.describe SaleRealsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sale_reals").to route_to("sale_reals#index")
    end

    it "routes to #new" do
      expect(:get => "/sale_reals/new").to route_to("sale_reals#new")
    end

    it "routes to #show" do
      expect(:get => "/sale_reals/1").to route_to("sale_reals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sale_reals/1/edit").to route_to("sale_reals#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sale_reals").to route_to("sale_reals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sale_reals/1").to route_to("sale_reals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sale_reals/1").to route_to("sale_reals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sale_reals/1").to route_to("sale_reals#destroy", :id => "1")
    end

  end
end
