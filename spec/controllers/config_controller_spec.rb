require 'rails_helper'

RSpec.describe ConfigController, type: :controller do

  describe "GET #change_plan" do
    it "returns http success" do
      get :change_plan
      expect(response).to have_http_status(:success)
    end
  end

end
