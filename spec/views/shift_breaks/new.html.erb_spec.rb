require 'rails_helper'

RSpec.describe "shift_breaks/new", type: :view do
  before(:each) do
    assign(:shift_break, ShiftBreak.new(
      :seller => nil
    ))
  end

  it "renders new shift_break form" do
    render

    assert_select "form[action=?][method=?]", shift_breaks_path, "post" do

      assert_select "input[name=?]", "shift_break[seller_id]"
    end
  end
end
