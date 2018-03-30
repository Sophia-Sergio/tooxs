require 'rails_helper'

RSpec.describe "sale_reals/show", type: :view do
  before(:each) do
    @sale_real = assign(:sale_real, SaleReal.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
  end
end
