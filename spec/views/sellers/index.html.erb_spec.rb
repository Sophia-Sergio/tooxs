require 'rails_helper'

RSpec.describe "sellers/index", type: :view do
  before(:each) do
    assign(:sellers, [
      Seller.create!(
        :rut => "Rut",
        :name => "Name",
        :lastname => "Lastname",
        :email => "Email",
        :phone => "Phone",
        :street => "Street",
        :number => "Number",
        :city => "City",
        :district => "District",
        :county => "County",
        :country => "Country",
        :department => nil
      ),
      Seller.create!(
        :rut => "Rut",
        :name => "Name",
        :lastname => "Lastname",
        :email => "Email",
        :phone => "Phone",
        :street => "Street",
        :number => "Number",
        :city => "City",
        :district => "District",
        :county => "County",
        :country => "Country",
        :department => nil
      )
    ])
  end

  it "renders a list of sellers" do
    render
    assert_select "tr>td", :text => "Rut".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "District".to_s, :count => 2
    assert_select "tr>td", :text => "County".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
