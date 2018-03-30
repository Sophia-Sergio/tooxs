require 'rails_helper'

RSpec.describe "available_shifts/index", type: :view do
  before(:each) do
    assign(:available_shifts, [
      AvailableShift.create!(
        :store => nil,
        :num => 2,
        :name => "Name",
        :month => 3,
        :week => 4,
        :day => "Day",
        :nine => false,
        :ten => false,
        :eleven => false,
        :twelve => false,
        :thirteen => false,
        :fourteen => false,
        :fifteen => false,
        :sixteen => false,
        :seventeen => false,
        :eighteen => false,
        :nineteen => false,
        :twenty => false,
        :twenty_one => false,
        :twenty_two => false,
        :twenty_three => false,
        :twenty_four => false
      ),
      AvailableShift.create!(
        :store => nil,
        :num => 2,
        :name => "Name",
        :month => 3,
        :week => 4,
        :day => "Day",
        :nine => false,
        :ten => false,
        :eleven => false,
        :twelve => false,
        :thirteen => false,
        :fourteen => false,
        :fifteen => false,
        :sixteen => false,
        :seventeen => false,
        :eighteen => false,
        :nineteen => false,
        :twenty => false,
        :twenty_one => false,
        :twenty_two => false,
        :twenty_three => false,
        :twenty_four => false
      )
    ])
  end

  it "renders a list of available_shifts" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Day".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
