require 'rails_helper'

RSpec.describe "hs/edit", type: :view do
  before(:each) do
    @hs = assign(:hs, Hs.create!(
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

  it "renders the edit hs form" do
    render

    assert_select "form[action=?][method=?]", hs_path(@hs), "post" do

      assert_select "input[name=?]", "hs[store_id]"

      assert_select "input[name=?]", "hs[department_id]"

      assert_select "input[name=?]", "hs[year]"

      assert_select "input[name=?]", "hs[month]"

      assert_select "input[name=?]", "hs[week]"

      assert_select "input[name=?]", "hs[dow]"

      assert_select "input[name=?]", "hs[nine]"

      assert_select "input[name=?]", "hs[ten]"

      assert_select "input[name=?]", "hs[eleven]"

      assert_select "input[name=?]", "hs[twelve]"

      assert_select "input[name=?]", "hs[thirteen]"

      assert_select "input[name=?]", "hs[fourteen]"

      assert_select "input[name=?]", "hs[fifteen]"

      assert_select "input[name=?]", "hs[sixteen]"

      assert_select "input[name=?]", "hs[seventeen]"

      assert_select "input[name=?]", "hs[eighteen]"

      assert_select "input[name=?]", "hs[nineteen]"

      assert_select "input[name=?]", "hs[twenty]"

      assert_select "input[name=?]", "hs[twenty_one]"

      assert_select "input[name=?]", "hs[twenty_two]"

      assert_select "input[name=?]", "hs[twenty_three]"

      assert_select "input[name=?]", "hs[total_day]"
    end
  end
end
