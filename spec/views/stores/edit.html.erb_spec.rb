require 'rails_helper'

RSpec.describe "stores/edit", type: :view do
  before(:each) do
    @store = assign(:store, create(:store))
  end

  it "renders the edit store form" do
    render

    assert_select "form[action=?][method=?]", store_path(@store), "post" do

      assert_select "input[name=?]", "store[name]"

      assert_select "input[name=?]", "store[street]"

      assert_select "input[name=?]", "store[number]"

      assert_select "input[name=?]", "store[city]"

      assert_select "input[name=?]", "store[district]"

      assert_select "input[name=?]", "store[country]"
    end
  end
end
