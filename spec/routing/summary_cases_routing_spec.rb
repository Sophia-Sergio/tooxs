require "rails_helper"

RSpec.describe SummaryCasesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/summary_cases").to route_to("summary_cases#index")
    end

    it "routes to #new" do
      expect(:get => "/summary_cases/new").to route_to("summary_cases#new")
    end

    it "routes to #show" do
      expect(:get => "/summary_cases/1").to route_to("summary_cases#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/summary_cases/1/edit").to route_to("summary_cases#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/summary_cases").to route_to("summary_cases#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/summary_cases/1").to route_to("summary_cases#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/summary_cases/1").to route_to("summary_cases#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/summary_cases/1").to route_to("summary_cases#destroy", :id => "1")
    end

  end
end
