require 'rails_helper'

RSpec.describe "master_departments/index", type: :view do
  before(:each) do
    assign(:master_departments, [
      MasterDepartment.create!(
        :name => "Name"
      ),
      MasterDepartment.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of master_departments" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
