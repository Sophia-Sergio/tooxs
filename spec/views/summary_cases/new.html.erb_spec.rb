require 'rails_helper'

RSpec.describe "summary_cases/new", type: :view do
  before(:each) do
    assign(:summary_case, SummaryCase.new(
      :id_case => 1,
      :sale_plan => "MyString",
      :coverange_deficit => "MyString",
      :surplus_coverange => "MyString",
      :total_deviation => "MyString",
      :cost_of_remunerations => "MyString",
      :margin_adjustment => "MyString"
    ))
  end

  it "renders new summary_case form" do
    render

    assert_select "form[action=?][method=?]", summary_cases_path, "post" do

      assert_select "input[name=?]", "summary_case[id_case]"

      assert_select "input[name=?]", "summary_case[sale_plan]"

      assert_select "input[name=?]", "summary_case[coverange_deficit]"

      assert_select "input[name=?]", "summary_case[surplus_coverange]"

      assert_select "input[name=?]", "summary_case[total_deviation]"

      assert_select "input[name=?]", "summary_case[cost_of_remunerations]"

      assert_select "input[name=?]", "summary_case[margin_adjustment]"
    end
  end
end
