require 'rails_helper'

RSpec.describe "sps/index", type: :view do
  before(:each) do
    assign(:sps, [
      Sp.create!(
        :store => nil,
        :department => nil,
        :year => 2,
        :month => 3,
        :week => 4,
        :dow => 5,
        :sale => 6
      ),
      Sp.create!(
        :store => nil,
        :department => nil,
        :year => 2,
        :month => 3,
        :week => 4,
        :dow => 5,
        :sale => 6
      )
    ])
  end

  it "renders a list of sps" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
  end
end
