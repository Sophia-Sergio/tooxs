require 'rails_helper'

RSpec.describe "SaleBySellers", type: :request do
  describe "GET /sale_by_sellers" do
    it "works! (now write some real specs)" do
      get sale_by_sellers_path
      expect(response).to have_http_status(200)
    end
  end
end
