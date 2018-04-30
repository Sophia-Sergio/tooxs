require "rails_helper"

RSpec.describe SaleBySellersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sale_by_sellers").to route_to("sale_by_sellers#index")
    end

    it "routes to #new" do
      expect(:get => "/sale_by_sellers/new").to route_to("sale_by_sellers#new")
    end

    it "routes to #show" do
      expect(:get => "/sale_by_sellers/1").to route_to("sale_by_sellers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sale_by_sellers/1/edit").to route_to("sale_by_sellers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sale_by_sellers").to route_to("sale_by_sellers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sale_by_sellers/1").to route_to("sale_by_sellers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sale_by_sellers/1").to route_to("sale_by_sellers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sale_by_sellers/1").to route_to("sale_by_sellers#destroy", :id => "1")
    end

  end
end
