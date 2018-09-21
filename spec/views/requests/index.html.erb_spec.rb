require 'rails_helper'

RSpec.describe "requests/index", type: :view do
  before(:each) do
    assign(:requests, [
      Request.create!(
        :user_id => 2
      ),
      Request.create!(
        :user_id => 2
      )
    ])
  end

  it "renders a list of requests" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
