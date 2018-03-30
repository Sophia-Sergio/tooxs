require "rails_helper"

RSpec.describe RsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rs").to route_to("rs#index")
    end

    it "routes to #new" do
      expect(:get => "/rs/new").to route_to("rs#new")
    end

    it "routes to #show" do
      expect(:get => "/rs/1").to route_to("rs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rs/1/edit").to route_to("rs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rs").to route_to("rs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/rs/1").to route_to("rs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/rs/1").to route_to("rs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rs/1").to route_to("rs#destroy", :id => "1")
    end

  end
end
