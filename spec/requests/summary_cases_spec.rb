require 'rails_helper'

RSpec.describe "SummaryCases", type: :request do
  describe "GET /summary_cases" do
    it "works! (now write some real specs)" do
      get summary_cases_path
      expect(response).to have_http_status(200)
    end
  end
end
