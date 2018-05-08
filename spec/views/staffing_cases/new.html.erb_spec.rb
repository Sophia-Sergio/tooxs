require 'rails_helper'

RSpec.describe "staffing_cases/new", type: :view do
  before(:each) do
    assign(:staffing_case, StaffingCase.new(
      :id_case => 1,
      :tolerance => 1,
      :actual_staffing_eval => 1,
      :max_time => 1,
      :user => "MyString"
    ))
  end

  it "renders new staffing_case form" do
    render

    assert_select "form[action=?][method=?]", staffing_cases_path, "post" do

      assert_select "input[name=?]", "staffing_case[id_case]"

      assert_select "input[name=?]", "staffing_case[tolerance]"

      assert_select "input[name=?]", "staffing_case[actual_staffing_eval]"

      assert_select "input[name=?]", "staffing_case[max_time]"

      assert_select "input[name=?]", "staffing_case[user]"
    end
  end
end
