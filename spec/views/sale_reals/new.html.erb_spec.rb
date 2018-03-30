require 'rails_helper'

RSpec.describe "sale_reals/new", type: :view do
  before(:each) do
    assign(:sale_real, SaleReal.new(
      :store => nil,
      :department => nil,
      :nine => "",
      :ten => "",
      :eleven => "",
      :twelve => "",
      :thirteen => "",
      :fourteen => "",
      :fifteen => "",
      :sixteen => "",
      :seventeen => "",
      :eigthteen => "",
      :nineteen => "",
      :twenty => "",
      :twenty_one => "",
      :twenty_two => "",
      :twenty_three => "",
      :twenty_four => "",
      :week => 1,
      :month => 1,
      :year => 1,
      :day_number => 1
    ))
  end

  it "renders new sale_real form" do
    render

    assert_select "form[action=?][method=?]", sale_reals_path, "post" do

      assert_select "input[name=?]", "sale_real[store_id]"

      assert_select "input[name=?]", "sale_real[department_id]"

      assert_select "input[name=?]", "sale_real[nine]"

      assert_select "input[name=?]", "sale_real[ten]"

      assert_select "input[name=?]", "sale_real[eleven]"

      assert_select "input[name=?]", "sale_real[twelve]"

      assert_select "input[name=?]", "sale_real[thirteen]"

      assert_select "input[name=?]", "sale_real[fourteen]"

      assert_select "input[name=?]", "sale_real[fifteen]"

      assert_select "input[name=?]", "sale_real[sixteen]"

      assert_select "input[name=?]", "sale_real[seventeen]"

      assert_select "input[name=?]", "sale_real[eigthteen]"

      assert_select "input[name=?]", "sale_real[nineteen]"

      assert_select "input[name=?]", "sale_real[twenty]"

      assert_select "input[name=?]", "sale_real[twenty_one]"

      assert_select "input[name=?]", "sale_real[twenty_two]"

      assert_select "input[name=?]", "sale_real[twenty_three]"

      assert_select "input[name=?]", "sale_real[twenty_four]"

      assert_select "input[name=?]", "sale_real[week]"

      assert_select "input[name=?]", "sale_real[month]"

      assert_select "input[name=?]", "sale_real[year]"

      assert_select "input[name=?]", "sale_real[day_number]"
    end
  end
end
