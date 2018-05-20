require 'rails_helper'

RSpec.describe "MasterDepartments", type: :request do
  describe "GET /master_departments" do
    it "works! (now write some real specs)" do
      get master_departments_path
      expect(response).to have_http_status(200)
    end
  end
end
