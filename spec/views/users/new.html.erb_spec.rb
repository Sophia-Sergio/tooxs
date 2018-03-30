require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :name => "MyString",
      :lastname => "MyString",
      :surname => "MyString",
      :role => 1,
      :picture => "MyString",
      :status => 1,
      :position => "MyString",
      :rut => 1
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[lastname]"

      assert_select "input[name=?]", "user[surname]"

      assert_select "input[name=?]", "user[role]"

      assert_select "input[name=?]", "user[picture]"

      assert_select "input[name=?]", "user[status]"

      assert_select "input[name=?]", "user[position]"

      assert_select "input[name=?]", "user[rut]"
    end
  end
end
