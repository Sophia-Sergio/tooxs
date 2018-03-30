require 'rails_helper'

RSpec.describe "AvailableShifts", type: :request do
  describe "GET /available_shifts" do
    it "works! (now write some real specs)" do
      get available_shifts_path
      expect(response).to have_http_status(200)
    end
  end
end
