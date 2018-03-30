require "rails_helper"

RSpec.describe SPsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sps").to route_to("sps#index")
    end

    it "routes to #new" do
      expect(:get => "/sps/new").to route_to("sps#new")
    end

    it "routes to #show" do
      expect(:get => "/sps/1").to route_to("sps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sps/1/edit").to route_to("sps#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sps").to route_to("sps#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sps/1").to route_to("sps#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sps/1").to route_to("sps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sps/1").to route_to("sps#destroy", :id => "1")
    end

  end
end
