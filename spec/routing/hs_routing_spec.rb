require "rails_helper"

RSpec.describe HsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/hs").to route_to("hs#index")
    end

    it "routes to #new" do
      expect(:get => "/hs/new").to route_to("hs#new")
    end

    it "routes to #show" do
      expect(:get => "/hs/1").to route_to("hs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/hs/1/edit").to route_to("hs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/hs").to route_to("hs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/hs/1").to route_to("hs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/hs/1").to route_to("hs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/hs/1").to route_to("hs#destroy", :id => "1")
    end

  end
end
