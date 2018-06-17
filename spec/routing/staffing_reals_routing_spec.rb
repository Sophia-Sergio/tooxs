require "rails_helper"

RSpec.describe StaffingRealsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/staffing_reals").to route_to("staffing_reals#index")
    end

    it "routes to #new" do
      expect(:get => "/staffing_reals/new").to route_to("staffing_reals#new")
    end

    it "routes to #show" do
      expect(:get => "/staffing_reals/1").to route_to("staffing_reals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/staffing_reals/1/edit").to route_to("staffing_reals#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/staffing_reals").to route_to("staffing_reals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/staffing_reals/1").to route_to("staffing_reals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/staffing_reals/1").to route_to("staffing_reals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/staffing_reals/1").to route_to("staffing_reals#destroy", :id => "1")
    end

  end
end
