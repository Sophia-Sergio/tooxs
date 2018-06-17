require 'rails_helper'

RSpec.describe "staffing_reals/show", type: :view do
  before(:each) do
    @staffing_real = assign(:staffing_real, StaffingReal.create!(
      :seller => 2,
      :hour => 3,
      :department => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
