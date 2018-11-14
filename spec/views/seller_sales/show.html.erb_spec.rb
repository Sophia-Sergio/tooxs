require 'rails_helper'

RSpec.describe "sale_by_sellers/show", type: :view do
  before(:each) do
    @sale_by_seller = assign(:sale_by_seller, SellerSale.create!(
      :seller => 2,
      :month => 3,
      :week => 4,
      :day => 5,
      :time => 6,
      :store_id => 7,
      :sale => 8.5,
      :turn => 9,
      :year => 10
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8.5/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/10/)
  end
end
