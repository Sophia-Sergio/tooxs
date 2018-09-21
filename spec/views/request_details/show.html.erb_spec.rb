require 'rails_helper'

RSpec.describe "request_details/show", type: :view do
  before(:each) do
    @request_detail = assign(:request_detail, RequestDetail.create!(
      :request_id => 2,
      :department_id => 3,
      :turn => 4,
      :quantity => 5,
      :rrhh => 6,
      :internal => 7,
      :laborum => 8,
      :trabajando => 9
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
  end
end
