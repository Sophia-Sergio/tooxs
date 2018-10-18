require 'rails_helper'

RSpec.describe "request_details/index", type: :view do
  before(:each) do
    assign(:request_details, [
      RequestDetail.create!(
        :request_id => 2,
        :department_id => 3,
        :turn => 4,
        :quantity => 5,
        :rrhh => 6,
        :internal => 7,
        :laborum => 8,
        :trabajando => 9
      ),
      RequestDetail.create!(
        :request_id => 2,
        :department_id => 3,
        :turn => 4,
        :quantity => 5,
        :rrhh => 6,
        :internal => 7,
        :laborum => 8,
        :trabajando => 9
      )
    ])
  end

  it "renders a list of request_details" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
  end
end
