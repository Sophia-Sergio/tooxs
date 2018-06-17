require 'rails_helper'

RSpec.describe "staffing_reals/edit", type: :view do
  before(:each) do
    @staffing_real = assign(:staffing_real, StaffingReal.create!(
      :seller => 1,
      :hour => 1,
      :department => 1
    ))
  end

  it "renders the edit staffing_real form" do
    render

    assert_select "form[action=?][method=?]", staffing_real_path(@staffing_real), "post" do

      assert_select "input[name=?]", "staffing_real[seller]"

      assert_select "input[name=?]", "staffing_real[hour]"

      assert_select "input[name=?]", "staffing_real[department]"
    end
  end
end
