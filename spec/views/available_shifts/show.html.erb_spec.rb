require 'rails_helper'

RSpec.describe "available_shifts/show", type: :view do
  before(:each) do
    @available_shift = assign(:available_shift, AvailableShift.create!(
      :store => nil,
      :num => 2,
      :name => "Name",
      :month => 3,
      :week => 4,
      :day => "Day",
      :nine => false,
      :ten => false,
      :eleven => false,
      :twelve => false,
      :thirteen => false,
      :fourteen => false,
      :fifteen => false,
      :sixteen => false,
      :seventeen => false,
      :eighteen => false,
      :nineteen => false,
      :twenty => false,
      :twenty_one => false,
      :twenty_two => false,
      :twenty_three => false,
      :twenty_four => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Day/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
