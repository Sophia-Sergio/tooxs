require 'rails_helper'

RSpec.describe "available_shifts/edit", type: :view do
  before(:each) do
    @available_shift = assign(:available_shift, AvailableShift.create!(
      :store => nil,
      :num => 1,
      :name => "MyString",
      :month => 1,
      :week => 1,
      :day => "MyString",
      :nine => false,
      :ten => false,
      :eleven => false,
      :twelve => false,
      :thirteen => false,
      :fourteen => false,
      :fifteen => false,
      :sixteen => false,
      :seventeen => false,
      :eighteen => false,
      :nineteen => false,
      :twenty => false,
      :twenty_one => false,
      :twenty_two => false,
      :twenty_three => false,
      :twenty_four => false
    ))
  end

  it "renders the edit available_shift form" do
    render

    assert_select "form[action=?][method=?]", available_shift_path(@available_shift), "post" do

      assert_select "input[name=?]", "available_shift[store_id]"

      assert_select "input[name=?]", "available_shift[num]"

      assert_select "input[name=?]", "available_shift[name]"

      assert_select "input[name=?]", "available_shift[month]"

      assert_select "input[name=?]", "available_shift[week]"

      assert_select "input[name=?]", "available_shift[day]"

      assert_select "input[name=?]", "available_shift[nine]"

      assert_select "input[name=?]", "available_shift[ten]"

      assert_select "input[name=?]", "available_shift[eleven]"

      assert_select "input[name=?]", "available_shift[twelve]"

      assert_select "input[name=?]", "available_shift[thirteen]"

      assert_select "input[name=?]", "available_shift[fourteen]"

      assert_select "input[name=?]", "available_shift[fifteen]"

      assert_select "input[name=?]", "available_shift[sixteen]"

      assert_select "input[name=?]", "available_shift[seventeen]"

      assert_select "input[name=?]", "available_shift[eighteen]"

      assert_select "input[name=?]", "available_shift[nineteen]"

      assert_select "input[name=?]", "available_shift[twenty]"

      assert_select "input[name=?]", "available_shift[twenty_one]"

      assert_select "input[name=?]", "available_shift[twenty_two]"

      assert_select "input[name=?]", "available_shift[twenty_three]"

      assert_select "input[name=?]", "available_shift[twenty_four]"
    end
  end
end
