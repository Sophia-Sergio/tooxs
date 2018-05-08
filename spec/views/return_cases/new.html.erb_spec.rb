require 'rails_helper'

RSpec.describe "return_cases/new", type: :view do
  before(:each) do
    assign(:return_case, ReturnCase.new(
      :id_case => 1,
      :eff_margin => "MyString",
      :total_surplus => 1,
      :compensation_cost => "MyString",
      :integer => "MyString",
      :status => "MyString",
      :user => "MyString",
      :message => "MyString",
      :deficit_total => 1,
      :tolerance => "MyString",
      :version => "MyString",
      :format_result => "MyString",
      :max_time => "MyString",
      :lunchs => "MyString",
      :turns => "MyString",
      :delta => "MyString",
      :epsilon => "MyString",
      :support => "MyString",
      :model => "MyString",
      :sales_plan => 1,
      :obj_function => 1
    ))
  end

  it "renders new return_case form" do
    render

    assert_select "form[action=?][method=?]", return_cases_path, "post" do

      assert_select "input[name=?]", "return_case[id_case]"

      assert_select "input[name=?]", "return_case[eff_margin]"

      assert_select "input[name=?]", "return_case[total_surplus]"

      assert_select "input[name=?]", "return_case[compensation_cost]"

      assert_select "input[name=?]", "return_case[integer]"

      assert_select "input[name=?]", "return_case[status]"

      assert_select "input[name=?]", "return_case[user]"

      assert_select "input[name=?]", "return_case[message]"

      assert_select "input[name=?]", "return_case[deficit_total]"

      assert_select "input[name=?]", "return_case[tolerance]"

      assert_select "input[name=?]", "return_case[version]"

      assert_select "input[name=?]", "return_case[format_result]"

      assert_select "input[name=?]", "return_case[max_time]"

      assert_select "input[name=?]", "return_case[lunchs]"

      assert_select "input[name=?]", "return_case[turns]"

      assert_select "input[name=?]", "return_case[delta]"

      assert_select "input[name=?]", "return_case[epsilon]"

      assert_select "input[name=?]", "return_case[support]"

      assert_select "input[name=?]", "return_case[model]"

      assert_select "input[name=?]", "return_case[sales_plan]"

      assert_select "input[name=?]", "return_case[obj_function]"
    end
  end
end
