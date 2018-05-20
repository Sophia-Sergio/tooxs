require 'rails_helper'

RSpec.describe "master_departments/show", type: :view do
  before(:each) do
    @master_department = assign(:master_department, MasterDepartment.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
