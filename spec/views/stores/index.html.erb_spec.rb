require 'rails_helper'

RSpec.describe "stores/index", type: :view do
  before(:each) do
    @stores = []
    10.times { @stores << create(:store) }
    assign(:stores, @stores)
  end

  it "renders a list of stores" do
    render
    @stores.each do |store|
      assert_select 'tr>td', text: store.name
      assert_select 'tr>td', text: store.street
      assert_select 'tr>td', text: store.number
      assert_select 'tr>td', text: store.city
      assert_select 'tr>td', text: store.district
      assert_select 'tr>td', text: store.country
    end
  end
end
