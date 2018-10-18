require 'rails_helper'

RSpec.describe "request_details/new", type: :view do
  before(:each) do
    assign(:request_detail, RequestDetail.new(
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

  it "renders new request_detail form" do
    render

    assert_select "form[action=?][method=?]", request_details_path, "post" do

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
