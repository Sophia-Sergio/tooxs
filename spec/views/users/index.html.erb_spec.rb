require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :lastname => "Lastname",
        :surname => "Surname",
        :role => 2,
        :picture => "Picture",
        :status => 3,
        :position => "Position",
        :rut => 4
      ),
      User.create!(
        :name => "Name",
        :lastname => "Lastname",
        :surname => "Surname",
        :role => 2,
        :picture => "Picture",
        :status => 3,
        :position => "Position",
        :rut => 4
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Surname".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Position".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
