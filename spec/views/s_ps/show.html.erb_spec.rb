require 'rails_helper'

RSpec.describe "sps/show", type: :view do
  before(:each) do
    @sp = assign(:sp, Sp.create!(
      :store => nil,
      :department => nil,
      :year => 2,
      :month => 3,
      :week => 4,
      :dow => 5,
      :sale => 6
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
  end
end
