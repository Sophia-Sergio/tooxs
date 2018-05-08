require 'rails_helper'

RSpec.describe "staffing_cases/show", type: :view do
  before(:each) do
    @staffing_case = assign(:staffing_case, StaffingCase.create!(
      :id_case => 2,
      :tolerance => 3,
      :actual_staffing_eval => 4,
      :max_time => 5,
      :user => "User"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/User/)
  end
end
