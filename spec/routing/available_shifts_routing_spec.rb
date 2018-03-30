require "rails_helper"

RSpec.describe AvailableShiftsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/available_shifts").to route_to("available_shifts#index")
    end

    it "routes to #new" do
      expect(:get => "/available_shifts/new").to route_to("available_shifts#new")
    end

    it "routes to #show" do
      expect(:get => "/available_shifts/1").to route_to("available_shifts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/available_shifts/1/edit").to route_to("available_shifts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/available_shifts").to route_to("available_shifts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/available_shifts/1").to route_to("available_shifts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/available_shifts/1").to route_to("available_shifts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/available_shifts/1").to route_to("available_shifts#destroy", :id => "1")
    end

  end
end
