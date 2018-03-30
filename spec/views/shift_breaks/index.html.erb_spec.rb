require 'rails_helper'

RSpec.describe "shift_breaks/index", type: :view do
  before(:each) do
    assign(:shift_breaks, [
      ShiftBreak.create!(
        :seller => nil
      ),
      ShiftBreak.create!(
        :seller => nil
      )
    ])
  end

  it "renders a list of shift_breaks" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
