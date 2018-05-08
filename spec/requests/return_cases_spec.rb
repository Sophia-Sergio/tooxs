require 'rails_helper'

RSpec.describe "ReturnCases", type: :request do
  describe "GET /return_cases" do
    it "works! (now write some real specs)" do
      get return_cases_path
      expect(response).to have_http_status(200)
    end
  end
end
