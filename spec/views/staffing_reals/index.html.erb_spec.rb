require 'rails_helper'

RSpec.describe "staffing_reals/index", type: :view do
  before(:each) do
    assign(:staffing_reals, [
      StaffingReal.create!(
        :department => nil,
        :year => 2,
        :month => 3,
        :day => 4,
        :count => 5
      ),
      StaffingReal.create!(
        :department => nil,
        :year => 2,
        :month => 3,
        :day => 4,
        :count => 5
      )
    ])
  end

  it "renders a list of staffing_reals" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
