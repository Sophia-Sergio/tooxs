require 'rails_helper'

RSpec.describe "summary_cases/index", type: :view do
  before(:each) do
    assign(:summary_cases, [
      SummaryCase.create!(
        :id_case => 2,
        :sale_plan => "Sale Plan",
        :coverange_deficit => "Coverange Deficit",
        :surplus_coverange => "Surplus Coverange",
        :total_deviation => "Total Deviation",
        :cost_of_remunerations => "Cost Of Remunerations",
        :margin_adjustment => "Margin Adjustment"
      ),
      SummaryCase.create!(
        :id_case => 2,
        :sale_plan => "Sale Plan",
        :coverange_deficit => "Coverange Deficit",
        :surplus_coverange => "Surplus Coverange",
        :total_deviation => "Total Deviation",
        :cost_of_remunerations => "Cost Of Remunerations",
        :margin_adjustment => "Margin Adjustment"
      )
    ])
  end

  it "renders a list of summary_cases" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Sale Plan".to_s, :count => 2
    assert_select "tr>td", :text => "Coverange Deficit".to_s, :count => 2
    assert_select "tr>td", :text => "Surplus Coverange".to_s, :count => 2
    assert_select "tr>td", :text => "Total Deviation".to_s, :count => 2
    assert_select "tr>td", :text => "Cost Of Remunerations".to_s, :count => 2
    assert_select "tr>td", :text => "Margin Adjustment".to_s, :count => 2
  end
end
