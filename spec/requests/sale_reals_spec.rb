require 'rails_helper'

RSpec.describe "SaleReals", type: :request do
  describe "GET /sale_reals" do
    it "works! (now write some real specs)" do
      get sale_reals_path
      expect(response).to have_http_status(200)
    end
  end
end
