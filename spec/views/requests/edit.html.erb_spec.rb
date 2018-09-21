require 'rails_helper'

RSpec.describe "requests/edit", type: :view do
  before(:each) do
    @request = assign(:request, Request.create!(
      :user_id => 1
    ))
  end

  it "renders the edit request form" do
    render

    assert_select "form[action=?][method=?]", request_path(@request), "post" do

      assert_select "input[name=?]", "request[user_id]"
    end
  end
end
