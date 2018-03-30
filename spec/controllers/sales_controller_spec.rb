require 'rails_helper'

RSpec.describe SalesController, type: :controller do

  describe "GET #quarter" do
    it "returns http success" do
      get :quarter
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #week" do
    it "returns http success" do
      get :week
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #month" do
    it "returns http success" do
      get :month
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #day" do
    it "returns http success" do
      get :day
      expect(response).to have_http_status(:success)
    end
  end

end
