require 'rails_helper'

RSpec.describe "staffing_cases/index", type: :view do
  before(:each) do
    assign(:staffing_cases, [
      StaffingCase.create!(
        :id_case => 2,
        :tolerance => 3,
        :actual_staffing_eval => 4,
        :max_time => 5,
        :user => "User"
      ),
      StaffingCase.create!(
        :id_case => 2,
        :tolerance => 3,
        :actual_staffing_eval => 4,
        :max_time => 5,
        :user => "User"
      )
    ])
  end

  it "renders a list of staffing_cases" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "User".to_s, :count => 2
  end
end
