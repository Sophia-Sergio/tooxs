require 'rails_helper'

RSpec.describe "hs/show", type: :view do
  before(:each) do
    @hs = assign(:hs, Hs.create!(
      :store => nil,
      :department => nil,
      :year => 2,
      :month => 3,
      :week => 4,
      :dow => 5,
      :nine => "",
      :ten => "",
      :eleven => "",
      :twelve => "",
      :thirteen => "",
      :fourteen => "",
      :fifteen => "",
      :sixteen => "",
      :seventeen => "",
      :eighteen => "",
      :nineteen => "",
      :twenty => "",
      :twenty_one => "",
      :twenty_two => "",
      :twenty_three => "",
      :total_day => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
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
  end
end
