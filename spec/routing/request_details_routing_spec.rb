require "rails_helper"

RSpec.describe RequestDetailsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/request_details").to route_to("request_details#index")
    end

    it "routes to #new" do
      expect(:get => "/request_details/new").to route_to("request_details#new")
    end

    it "routes to #show" do
      expect(:get => "/request_details/1").to route_to("request_details#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/request_details/1/edit").to route_to("request_details#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/request_details").to route_to("request_details#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/request_details/1").to route_to("request_details#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/request_details/1").to route_to("request_details#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/request_details/1").to route_to("request_details#destroy", :id => "1")
    end

  end
end
