require 'rails_helper'

RSpec.describe "request_details/edit", type: :view do
  before(:each) do
    @request_detail = assign(:request_detail, RequestDetail.create!(
      :request_id => 1,
      :department_id => 1,
      :turn => 1,
      :quantity => 1,
      :rrhh => 1,
      :internal => 1,
      :laborum => 1,
      :trabajando => 1
    ))
  end

  it "renders the edit request_detail form" do
    render

    assert_select "form[action=?][method=?]", request_detail_path(@request_detail), "post" do

      assert_select "input[name=?]", "request_detail[request_id]"

      assert_select "input[name=?]", "request_detail[department_id]"

      assert_select "input[name=?]", "request_detail[turn]"

      assert_select "input[name=?]", "request_detail[quantity]"

      assert_select "input[name=?]", "request_detail[rrhh]"

      assert_select "input[name=?]", "request_detail[internal]"

      assert_select "input[name=?]", "request_detail[laborum]"

      assert_select "input[name=?]", "request_detail[trabajando]"
    end
  end
end
