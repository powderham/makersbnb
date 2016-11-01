
require 'spec_helper'


feature "home page" do
  scenario "has button to listings" do

    visit '/'
    click_button('See Listings')
    expect(page).to have_current_path('/listings')

  end
end
