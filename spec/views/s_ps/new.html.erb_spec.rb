require 'rails_helper'

RSpec.describe "sps/new", type: :view do
  before(:each) do
    assign(:sp, Sp.new(
      :store => nil,
      :department => nil,
      :year => 1,
      :month => 1,
      :week => 1,
      :dow => 1,
      :sale => 1
    ))
  end

  it "renders new sp form" do
    render

    assert_select "form[action=?][method=?]", sps_path, "post" do

      assert_select "input[name=?]", "sp[store_id]"

      assert_select "input[name=?]", "sp[department_id]"

      assert_select "input[name=?]", "sp[year]"

      assert_select "input[name=?]", "sp[month]"

      assert_select "input[name=?]", "sp[week]"

      assert_select "input[name=?]", "sp[dow]"

      assert_select "input[name=?]", "sp[sale]"
    end
  end
end
