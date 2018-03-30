require 'rails_helper'

RSpec.describe "sellers/show", type: :view do
  before(:each) do
    @seller = assign(:seller, Seller.create!(
      :rut => "Rut",
      :name => "Name",
      :lastname => "Lastname",
      :email => "Email",
      :phone => "Phone",
      :street => "Street",
      :number => "Number",
      :city => "City",
      :district => "District",
      :county => "County",
      :country => "Country",
      :department => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Rut/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Lastname/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Street/)
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/District/)
    expect(rendered).to match(/County/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(//)
  end
end
