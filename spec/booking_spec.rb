require 'web_helpers'
require 'spec_helper'


feature "Make booking" do

  let(:user) do
    User.create(email: 'ed@gmail.com', password: 'admin', first_name: 'Ed', last_name: 'Test', username: 'Ed', id: 1)
  end

  let(:listing) do
    Listing.create(name: 'Ed Manor', description: 'Woodsy', price: '10', date: '31.12.16', user_id: 1)
  end

  scenario "Should send a booking request" do
    create_user(user)
    sign_in(user)
    create_listing(listing)
    visit '/listings'
      within('div#listing_6') do
        click_button('Request Booking')
      end
    expect(page).to have_content('Booking request sent!')
    click_button('Return to listings')
  end
end
