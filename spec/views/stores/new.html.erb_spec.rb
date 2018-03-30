require 'rails_helper'

RSpec.describe "stores/new", type: :view do
  before(:each) do
    assign(:store, build(:store))
  end

  it "renders new store form" do
    render

    assert_select "form[action=?][method=?]", stores_path, "post" do

      assert_select "input[name=?]", "store[name]"

      assert_select "input[name=?]", "store[street]"

      assert_select "input[name=?]", "store[number]"

      assert_select "input[name=?]", "store[city]"

      assert_select "input[name=?]", "store[district]"

      assert_select "input[name=?]", "store[country]"
    end
  end
end
