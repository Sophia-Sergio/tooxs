require 'rails_helper'

RSpec.describe "stores/show", type: :view do
  before(:each) do
    @store = assign(:store, create(:store))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@store.name)
    expect(rendered).to match(@store.street)
    expect(rendered).to match(@store.number)
    expect(rendered).to match(@store.city)
    expect(rendered).to match(@store.district)
    expect(rendered).to match(@store.country)
  end
end
