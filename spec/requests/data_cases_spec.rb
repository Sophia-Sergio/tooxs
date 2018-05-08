require 'rails_helper'

RSpec.describe "DataCases", type: :request do
  describe "GET /data_cases" do
    it "works! (now write some real specs)" do
      get data_cases_path
      expect(response).to have_http_status(200)
    end
  end
end
