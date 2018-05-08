require "rails_helper"

RSpec.describe StaffingCasesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/staffing_cases").to route_to("staffing_cases#index")
    end

    it "routes to #new" do
      expect(:get => "/staffing_cases/new").to route_to("staffing_cases#new")
    end

    it "routes to #show" do
      expect(:get => "/staffing_cases/1").to route_to("staffing_cases#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/staffing_cases/1/edit").to route_to("staffing_cases#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/staffing_cases").to route_to("staffing_cases#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/staffing_cases/1").to route_to("staffing_cases#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/staffing_cases/1").to route_to("staffing_cases#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/staffing_cases/1").to route_to("staffing_cases#destroy", :id => "1")
    end

  end
end
