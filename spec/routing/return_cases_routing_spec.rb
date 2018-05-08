require "rails_helper"

RSpec.describe ReturnCasesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/return_cases").to route_to("return_cases#index")
    end

    it "routes to #new" do
      expect(:get => "/return_cases/new").to route_to("return_cases#new")
    end

    it "routes to #show" do
      expect(:get => "/return_cases/1").to route_to("return_cases#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/return_cases/1/edit").to route_to("return_cases#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/return_cases").to route_to("return_cases#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/return_cases/1").to route_to("return_cases#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/return_cases/1").to route_to("return_cases#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/return_cases/1").to route_to("return_cases#destroy", :id => "1")
    end

  end
end
