require 'rails_helper'

RSpec.describe "master_departments/edit", type: :view do
  before(:each) do
    @master_department = assign(:master_department, MasterDepartment.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit master_department form" do
    render

    assert_select "form[action=?][method=?]", master_department_path(@master_department), "post" do

      assert_select "input[name=?]", "master_department[name]"
    end
  end
end
