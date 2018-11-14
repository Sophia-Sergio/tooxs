require 'rails_helper'

RSpec.describe "sale_by_sellers/index", type: :view do
  before(:each) do
    assign(:sale_by_sellers, [
      SellerSale.create!(
        :seller => 2,
        :month => 3,
        :week => 4,
        :day => 5,
        :time => 6,
        :store_id => 7,
        :sale => 8.5,
        :turn => 9,
        :year => 10
      ),
      SellerSale.create!(
        :seller => 2,
        :month => 3,
        :week => 4,
        :day => 5,
        :time => 6,
        :store_id => 7,
        :sale => 8.5,
        :turn => 9,
        :year => 10
      )
    ])
  end

  it "renders a list of sale_by_sellers" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.5.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
  end
end
