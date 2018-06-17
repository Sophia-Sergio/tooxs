require 'rails_helper'

RSpec.describe "staffing_reals/new", type: :view do
  before(:each) do
    assign(:staffing_real, StaffingReal.new(
      :seller => 1,
      :hour => 1,
      :department => 1
    ))
  end

  it "renders new staffing_real form" do
    render

    assert_select "form[action=?][method=?]", staffing_reals_path, "post" do

      assert_select "input[name=?]", "staffing_real[seller]"

      assert_select "input[name=?]", "staffing_real[hour]"

      assert_select "input[name=?]", "staffing_real[department]"
    end
  end
end
