require 'rails_helper'

RSpec.describe "return_cases/index", type: :view do
  before(:each) do
    assign(:return_cases, [
      ReturnCase.create!(
        :id_case => 2,
        :eff_margin => "Eff Margin",
        :total_surplus => 3,
        :compensation_cost => "Compensation Cost",
        :integer => "Integer",
        :status => "Status",
        :user => "User",
        :message => "Message",
        :deficit_total => 4,
        :tolerance => "Tolerance",
        :version => "Version",
        :format_result => "Format Result",
        :max_time => "Max Time",
        :lunchs => "Lunchs",
        :turns => "Turns",
        :delta => "Delta",
        :epsilon => "Epsilon",
        :support => "Support",
        :model => "Model",
        :sales_plan => 5,
        :obj_function => 6
      ),
      ReturnCase.create!(
        :id_case => 2,
        :eff_margin => "Eff Margin",
        :total_surplus => 3,
        :compensation_cost => "Compensation Cost",
        :integer => "Integer",
        :status => "Status",
        :user => "User",
        :message => "Message",
        :deficit_total => 4,
        :tolerance => "Tolerance",
        :version => "Version",
        :format_result => "Format Result",
        :max_time => "Max Time",
        :lunchs => "Lunchs",
        :turns => "Turns",
        :delta => "Delta",
        :epsilon => "Epsilon",
        :support => "Support",
        :model => "Model",
        :sales_plan => 5,
        :obj_function => 6
      )
    ])
  end

  it "renders a list of return_cases" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Eff Margin".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Compensation Cost".to_s, :count => 2
    assert_select "tr>td", :text => "Integer".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => "User".to_s, :count => 2
    assert_select "tr>td", :text => "Message".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Tolerance".to_s, :count => 2
    assert_select "tr>td", :text => "Version".to_s, :count => 2
    assert_select "tr>td", :text => "Format Result".to_s, :count => 2
    assert_select "tr>td", :text => "Max Time".to_s, :count => 2
    assert_select "tr>td", :text => "Lunchs".to_s, :count => 2
    assert_select "tr>td", :text => "Turns".to_s, :count => 2
    assert_select "tr>td", :text => "Delta".to_s, :count => 2
    assert_select "tr>td", :text => "Epsilon".to_s, :count => 2
    assert_select "tr>td", :text => "Support".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
  end
end
