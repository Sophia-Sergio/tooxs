require 'rails_helper'

RSpec.describe "data_cases/show", type: :view do
  before(:each) do
    @data_case = assign(:data_case, DataCase.create!(
      :id_case => 2,
      :turn_num => 3,
      :dep_num => 4,
      :day_num => 5,
      :hour_day => 6,
      :hp_val => 7.5,
      :prod_obj => 8.5,
      :vhp => "Vhp",
      :pov => "Pov",
      :luch_in => "Luch In",
      :lunch_hours => "Lunch Hours",
      :hour_min => 9,
      :turns_matrix => "Turns Matrix",
      :real_dot => "Real Dot",
      :sale_plan => "Sale Plan"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7.5/)
    expect(rendered).to match(/8.5/)
    expect(rendered).to match(/Vhp/)
    expect(rendered).to match(/Pov/)
    expect(rendered).to match(/Luch In/)
    expect(rendered).to match(/Lunch Hours/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/Turns Matrix/)
    expect(rendered).to match(/Real Dot/)
    expect(rendered).to match(/Sale Plan/)
  end
end
