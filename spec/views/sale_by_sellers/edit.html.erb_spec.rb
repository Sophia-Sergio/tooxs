require 'rails_helper'

RSpec.describe "sale_by_sellers/edit", type: :view do
  before(:each) do
    @sale_by_seller = assign(:sale_by_seller, SaleBySeller.create!(
      :seller => 1,
      :month => 1,
      :week => 1,
      :day => 1,
      :time => 1,
      :store_id => 1,
      :sale => 1.5,
      :turn => 1,
      :year => 1
    ))
  end

  it "renders the edit sale_by_seller form" do
    render

    assert_select "form[action=?][method=?]", sale_by_seller_path(@sale_by_seller), "post" do

      assert_select "input[name=?]", "sale_by_seller[seller]"

      assert_select "input[name=?]", "sale_by_seller[month]"

      assert_select "input[name=?]", "sale_by_seller[week]"

      assert_select "input[name=?]", "sale_by_seller[day]"

      assert_select "input[name=?]", "sale_by_seller[time]"

      assert_select "input[name=?]", "sale_by_seller[store_id]"

      assert_select "input[name=?]", "sale_by_seller[sale]"

      assert_select "input[name=?]", "sale_by_seller[turn]"

      assert_select "input[name=?]", "sale_by_seller[year]"
    end
  end
end
