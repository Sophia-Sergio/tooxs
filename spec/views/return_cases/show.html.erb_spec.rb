require 'rails_helper'

RSpec.describe "return_cases/show", type: :view do
  before(:each) do
    @return_case = assign(:return_case, ReturnCase.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Eff Margin/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Compensation Cost/)
    expect(rendered).to match(/Integer/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/User/)
    expect(rendered).to match(/Message/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Tolerance/)
    expect(rendered).to match(/Version/)
    expect(rendered).to match(/Format Result/)
    expect(rendered).to match(/Max Time/)
    expect(rendered).to match(/Lunchs/)
    expect(rendered).to match(/Turns/)
    expect(rendered).to match(/Delta/)
    expect(rendered).to match(/Epsilon/)
    expect(rendered).to match(/Support/)
    expect(rendered).to match(/Model/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
  end
end
