require 'rails_helper'

RSpec.describe "data_cases/index", type: :view do
  before(:each) do
    assign(:data_cases, [
      DataCase.create!(
        :id_case => 2,
        :turn_num => 3,
        :dep_num => 4,
        :day_num => 5,
        :hour_day => 6,
        :hp_val => 7.5,
        :prod_obj => 8.5,
        :vhp => "Vhp",
        :pov => "Pov",
        :lunch_in => "Luch In",
        :lunch_hours => "Lunch Hours",
        :hour_min => 9,
        :turns_matrix => "Turns Matrix",
        :real_dot => "Real Dot",
        :sale_plan => "Sale Plan"
      ),
      DataCase.create!(
        :id_case => 2,
        :turn_num => 3,
        :dep_num => 4,
        :day_num => 5,
        :hour_day => 6,
        :hp_val => 7.5,
        :prod_obj => 8.5,
        :vhp => "Vhp",
        :pov => "Pov",
        :lunch_in => "Luch In",
        :lunch_hours => "Lunch Hours",
        :hour_min => 9,
        :turns_matrix => "Turns Matrix",
        :real_dot => "Real Dot",
        :sale_plan => "Sale Plan"
      )
    ])
  end

  it "renders a list of data_cases" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.5.to_s, :count => 2
    assert_select "tr>td", :text => 8.5.to_s, :count => 2
    assert_select "tr>td", :text => "Vhp".to_s, :count => 2
    assert_select "tr>td", :text => "Pov".to_s, :count => 2
    assert_select "tr>td", :text => "Luch In".to_s, :count => 2
    assert_select "tr>td", :text => "Lunch Hours".to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => "Turns Matrix".to_s, :count => 2
    assert_select "tr>td", :text => "Real Dot".to_s, :count => 2
    assert_select "tr>td", :text => "Sale Plan".to_s, :count => 2
  end
end
