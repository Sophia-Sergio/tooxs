require 'rails_helper'

RSpec.describe "sps/edit", type: :view do
  before(:each) do
    @sp = assign(:sp, Sp.create!(
      :store => nil,
      :department => nil,
      :year => 1,
      :month => 1,
      :week => 1,
      :dow => 1,
      :sale => 1
    ))
  end

  it "renders the edit sp form" do
    render

    assert_select "form[action=?][method=?]", sp_path(@sp), "post" do

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
