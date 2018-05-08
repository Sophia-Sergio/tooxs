require 'rails_helper'

RSpec.describe "summary_cases/show", type: :view do
  before(:each) do
    @summary_case = assign(:summary_case, SummaryCase.create!(
      :id_case => 2,
      :sale_plan => "Sale Plan",
      :coverange_deficit => "Coverange Deficit",
      :surplus_coverange => "Surplus Coverange",
      :total_deviation => "Total Deviation",
      :cost_of_remunerations => "Cost Of Remunerations",
      :margin_adjustment => "Margin Adjustment"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Sale Plan/)
    expect(rendered).to match(/Coverange Deficit/)
    expect(rendered).to match(/Surplus Coverange/)
    expect(rendered).to match(/Total Deviation/)
    expect(rendered).to match(/Cost Of Remunerations/)
    expect(rendered).to match(/Margin Adjustment/)
  end
end
