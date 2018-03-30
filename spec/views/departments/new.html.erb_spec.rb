require 'rails_helper'

RSpec.describe "departments/new", type: :view do
  before(:each) do
    assign(:department, Department.new(
      :origin_id => 1,
      :name => "MyString",
      :store => nil
    ))
  end

  it "renders new department form" do
    render

    assert_select "form[action=?][method=?]", departments_path, "post" do

      assert_select "input[name=?]", "department[origin_id]"

      assert_select "input[name=?]", "department[name]"

      assert_select "input[name=?]", "department[store_id]"
    end
  end
end
