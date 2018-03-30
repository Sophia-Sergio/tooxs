require 'rails_helper'

RSpec.describe "sellers/new", type: :view do
  before(:each) do
    assign(:seller, Seller.new(
      :rut => "MyString",
      :name => "MyString",
      :lastname => "MyString",
      :email => "MyString",
      :phone => "MyString",
      :street => "MyString",
      :number => "MyString",
      :city => "MyString",
      :district => "MyString",
      :county => "MyString",
      :country => "MyString",
      :department => nil
    ))
  end

  it "renders new seller form" do
    render

    assert_select "form[action=?][method=?]", sellers_path, "post" do

      assert_select "input[name=?]", "seller[rut]"

      assert_select "input[name=?]", "seller[name]"

      assert_select "input[name=?]", "seller[lastname]"

      assert_select "input[name=?]", "seller[email]"

      assert_select "input[name=?]", "seller[phone]"

      assert_select "input[name=?]", "seller[street]"

      assert_select "input[name=?]", "seller[number]"

      assert_select "input[name=?]", "seller[city]"

      assert_select "input[name=?]", "seller[district]"

      assert_select "input[name=?]", "seller[county]"

      assert_select "input[name=?]", "seller[country]"

      assert_select "input[name=?]", "seller[department_id]"
    end
  end
end
