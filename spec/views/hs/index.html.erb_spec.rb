require 'rails_helper'

RSpec.describe "hs/index", type: :view do
  before(:each) do
    assign(:hs, [
      Hs.create!(
        :store => nil,
        :department => nil,
        :year => 2,
        :month => 3,
        :week => 4,
        :dow => 5,
        :nine => "",
        :ten => "",
        :eleven => "",
        :twelve => "",
        :thirteen => "",
        :fourteen => "",
        :fifteen => "",
        :sixteen => "",
        :seventeen => "",
        :eighteen => "",
        :nineteen => "",
        :twenty => "",
        :twenty_one => "",
        :twenty_two => "",
        :twenty_three => "",
        :total_day => ""
      ),
      Hs.create!(
        :store => nil,
        :department => nil,
        :year => 2,
        :month => 3,
        :week => 4,
        :dow => 5,
        :nine => "",
        :ten => "",
        :eleven => "",
        :twelve => "",
        :thirteen => "",
        :fourteen => "",
        :fifteen => "",
        :sixteen => "",
        :seventeen => "",
        :eighteen => "",
        :nineteen => "",
        :twenty => "",
        :twenty_one => "",
        :twenty_two => "",
        :twenty_three => "",
        :total_day => ""
      )
    ])
  end

  it "renders a list of hs" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
