require 'rails_helper'

RSpec.describe "master_departments/new", type: :view do
  before(:each) do
    assign(:master_department, MasterDepartment.new(
      :name => "MyString"
    ))
  end

  it "renders new master_department form" do
    render

    assert_select "form[action=?][method=?]", master_departments_path, "post" do

      assert_select "input[name=?]", "master_department[name]"
    end
  end
end
