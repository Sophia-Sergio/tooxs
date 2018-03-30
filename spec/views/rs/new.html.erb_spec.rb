require 'rails_helper'

RSpec.describe "rs/new", type: :view do
  before(:each) do
    assign(:rs, Rs.new(
      :store => nil,
      :department => nil,
      :year => 1,
      :month => 1,
      :week => 1,
      :dow => 1,
      :nine => "",
      :ten => "",
      :eleven => "",
      :twelve => "",
      :thirteen => "",
      :fourteen => "",
      :fifteen => "",
      :sixteen => "",
      :seventeen => "",
      :eighteen => "",
      :nineteen => "",
      :twenty => "",
      :twenty_one => "",
      :twenty_two => "",
      :twenty_three => "",
      :total_day => ""
    ))
  end

  it "renders new rs form" do
    render

    assert_select "form[action=?][method=?]", rs_index_path, "post" do

      assert_select "input[name=?]", "rs[store_id]"

      assert_select "input[name=?]", "rs[department_id]"

      assert_select "input[name=?]", "rs[year]"

      assert_select "input[name=?]", "rs[month]"

      assert_select "input[name=?]", "rs[week]"

      assert_select "input[name=?]", "rs[dow]"

      assert_select "input[name=?]", "rs[nine]"

      assert_select "input[name=?]", "rs[ten]"

      assert_select "input[name=?]", "rs[eleven]"

      assert_select "input[name=?]", "rs[twelve]"

      assert_select "input[name=?]", "rs[thirteen]"

      assert_select "input[name=?]", "rs[fourteen]"

      assert_select "input[name=?]", "rs[fifteen]"

      assert_select "input[name=?]", "rs[sixteen]"

      assert_select "input[name=?]", "rs[seventeen]"

      assert_select "input[name=?]", "rs[eighteen]"

      assert_select "input[name=?]", "rs[nineteen]"

      assert_select "input[name=?]", "rs[twenty]"

      assert_select "input[name=?]", "rs[twenty_one]"

      assert_select "input[name=?]", "rs[twenty_two]"

      assert_select "input[name=?]", "rs[twenty_three]"

      assert_select "input[name=?]", "rs[total_day]"
    end
  end
end
