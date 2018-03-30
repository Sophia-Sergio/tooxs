require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "Name",
      :lastname => "Lastname",
      :surname => "Surname",
      :role => 2,
      :picture => "Picture",
      :status => 3,
      :position => "Position",
      :rut => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Lastname/)
    expect(rendered).to match(/Surname/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Picture/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Position/)
    expect(rendered).to match(/4/)
  end
end
