require 'rails_helper'

RSpec.describe "Rs", type: :request do
  describe "GET /rs" do
    it "works! (now write some real specs)" do
      get rs_index_path
      expect(response).to have_http_status(200)
    end
  end
end
