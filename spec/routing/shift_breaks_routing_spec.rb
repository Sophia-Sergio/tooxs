require "rails_helper"

RSpec.describe ShiftBreaksController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/shift_breaks").to route_to("shift_breaks#index")
    end

    it "routes to #new" do
      expect(:get => "/shift_breaks/new").to route_to("shift_breaks#new")
    end

    it "routes to #show" do
      expect(:get => "/shift_breaks/1").to route_to("shift_breaks#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/shift_breaks/1/edit").to route_to("shift_breaks#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/shift_breaks").to route_to("shift_breaks#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/shift_breaks/1").to route_to("shift_breaks#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/shift_breaks/1").to route_to("shift_breaks#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/shift_breaks/1").to route_to("shift_breaks#destroy", :id => "1")
    end

  end
end
