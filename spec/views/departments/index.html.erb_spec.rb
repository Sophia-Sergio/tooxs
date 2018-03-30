require 'rails_helper'

RSpec.describe "departments/index", type: :view do
  before(:each) do
    assign(:departments, [
      Department.create!(
        :origin_id => 2,
        :name => "Name",
        :store => nil
      ),
      Department.create!(
        :origin_id => 2,
        :name => "Name",
        :store => nil
      )
    ])
  end

  it "renders a list of departments" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
