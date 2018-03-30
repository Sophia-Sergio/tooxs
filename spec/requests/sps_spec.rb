require 'rails_helper'

RSpec.describe "Sps", type: :request do
  describe "GET /sps" do
    it "works! (now write some real specs)" do
      get sps_path
      expect(response).to have_http_status(200)
    end
  end
end
