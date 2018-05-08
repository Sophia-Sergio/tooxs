require 'rails_helper'

RSpec.describe "data_cases/edit", type: :view do
  before(:each) do
    @data_case = assign(:data_case, DataCase.create!(
      :id_case => 1,
      :turn_num => 1,
      :dep_num => 1,
      :day_num => 1,
      :hour_day => 1,
      :hp_val => 1.5,
      :prod_obj => 1.5,
      :vhp => "MyString",
      :pov => "MyString",
      :luch_in => "MyString",
      :lunch_hours => "MyString",
      :hour_min => 1,
      :turns_matrix => "MyString",
      :real_dot => "MyString",
      :sale_plan => "MyString"
    ))
  end

  it "renders the edit data_case form" do
    render

    assert_select "form[action=?][method=?]", data_case_path(@data_case), "post" do

      assert_select "input[name=?]", "data_case[id_case]"

      assert_select "input[name=?]", "data_case[turn_num]"

      assert_select "input[name=?]", "data_case[dep_num]"

      assert_select "input[name=?]", "data_case[day_num]"

      assert_select "input[name=?]", "data_case[hour_day]"

      assert_select "input[name=?]", "data_case[hp_val]"

      assert_select "input[name=?]", "data_case[prod_obj]"

      assert_select "input[name=?]", "data_case[vhp]"

      assert_select "input[name=?]", "data_case[pov]"

      assert_select "input[name=?]", "data_case[luch_in]"

      assert_select "input[name=?]", "data_case[lunch_hours]"

      assert_select "input[name=?]", "data_case[hour_min]"

      assert_select "input[name=?]", "data_case[turns_matrix]"

      assert_select "input[name=?]", "data_case[real_dot]"

      assert_select "input[name=?]", "data_case[sale_plan]"
    end
  end
end
