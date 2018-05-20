require "rails_helper"

RSpec.describe MasterDepartmentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/master_departments").to route_to("master_departments#index")
    end

    it "routes to #new" do
      expect(:get => "/master_departments/new").to route_to("master_departments#new")
    end

    it "routes to #show" do
      expect(:get => "/master_departments/1").to route_to("master_departments#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/master_departments/1/edit").to route_to("master_departments#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/master_departments").to route_to("master_departments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/master_departments/1").to route_to("master_departments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/master_departments/1").to route_to("master_departments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/master_departments/1").to route_to("master_departments#destroy", :id => "1")
    end

  end
end
