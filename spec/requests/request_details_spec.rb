require 'rails_helper'

RSpec.describe "RequestDetails", type: :request do
  describe "GET /request_details" do
    it "works! (now write some real specs)" do
      get request_details_path
      expect(response).to have_http_status(200)
    end
  end
end
