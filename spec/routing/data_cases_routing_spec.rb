require "rails_helper"

RSpec.describe DataCasesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/data_cases").to route_to("data_cases#index")
    end

    it "routes to #new" do
      expect(:get => "/data_cases/new").to route_to("data_cases#new")
    end

    it "routes to #show" do
      expect(:get => "/data_cases/1").to route_to("data_cases#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/data_cases/1/edit").to route_to("data_cases#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/data_cases").to route_to("data_cases#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/data_cases/1").to route_to("data_cases#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/data_cases/1").to route_to("data_cases#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/data_cases/1").to route_to("data_cases#destroy", :id => "1")
    end

  end
end
