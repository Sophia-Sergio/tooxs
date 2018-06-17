require 'rails_helper'

RSpec.describe "StaffingReals", type: :request do
  describe "GET /staffing_reals" do
    it "works! (now write some real specs)" do
      get staffing_reals_path
      expect(response).to have_http_status(200)
    end
  end
end
