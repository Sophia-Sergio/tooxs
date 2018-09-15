require 'rails_helper'

RSpec.describe "staffing_reals/show", type: :view do
  before(:each) do
    @staffing_real = assign(:staffing_real, StaffingReal.create!(
      :department => nil,
      :year => 2,
      :month => 3,
      :day => 4,
      :count => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
  end
end
