require 'rails_helper'

RSpec.describe "shift_breaks/edit", type: :view do
  before(:each) do
    @shift_break = assign(:shift_break, ShiftBreak.create!(
      :seller => nil
    ))
  end

  it "renders the edit shift_break form" do
    render

    assert_select "form[action=?][method=?]", shift_break_path(@shift_break), "post" do

      assert_select "input[name=?]", "shift_break[seller_id]"
    end
  end
end
