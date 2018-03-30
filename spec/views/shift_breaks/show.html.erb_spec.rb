require 'rails_helper'

RSpec.describe "shift_breaks/show", type: :view do
  before(:each) do
    @shift_break = assign(:shift_break, ShiftBreak.create!(
      :seller => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
