require 'rails_helper'

RSpec.describe "sale_reals/index", type: :view do
  before(:each) do
    assign(:sale_reals, [
      SaleReal.create!(
        :store => nil,
        :department => nil,
        :nine => "",
        :ten => "",
        :eleven => "",
        :twelve => "",
        :thirteen => "",
        :fourteen => "",
        :fifteen => "",
        :sixteen => "",
        :seventeen => "",
        :eigthteen => "",
        :nineteen => "",
        :twenty => "",
        :twenty_one => "",
        :twenty_two => "",
        :twenty_three => "",
        :twenty_four => "",
        :week => 2,
        :month => 3,
        :year => 4,
        :day_number => 5
      ),
      SaleReal.create!(
        :store => nil,
        :department => nil,
        :nine => "",
        :ten => "",
        :eleven => "",
        :twelve => "",
        :thirteen => "",
        :fourteen => "",
        :fifteen => "",
        :sixteen => "",
        :seventeen => "",
        :eigthteen => "",
        :nineteen => "",
        :twenty => "",
        :twenty_one => "",
        :twenty_two => "",
        :twenty_three => "",
        :twenty_four => "",
        :week => 2,
        :month => 3,
        :year => 4,
        :day_number => 5
      )
    ])
  end

  it "renders a list of sale_reals" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
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
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
