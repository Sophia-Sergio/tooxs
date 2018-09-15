require 'rails_helper'

RSpec.describe "staffing_reals/new", type: :view do
  before(:each) do
    assign(:staffing_real, StaffingReal.new(
      :department => nil,
      :year => 1,
      :month => 1,
      :day => 1,
      :count => 1
    ))
  end

  it "renders new staffing_real form" do
    render

    assert_select "form[action=?][method=?]", staffing_reals_path, "post" do

      assert_select "input[name=?]", "staffing_real[department_id]"

      assert_select "input[name=?]", "staffing_real[year]"

      assert_select "input[name=?]", "staffing_real[month]"

      assert_select "input[name=?]", "staffing_real[day]"

      assert_select "input[name=?]", "staffing_real[count]"
    end
  end
end
