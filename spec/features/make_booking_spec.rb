require './app/models/listing'
require 'spec_helper'

feature "Make booking" do

  let(:user) do
    User.create(email: 'ed@gmail.com', password: 'admin', first_name: 'Ed', last_name: 'Test', username: 'Ed', id: 1)
  end
  let(:listing) do
    Listing.create(name: 'Ed Manor', description: 'Woodsy', price: '10', date: '31.12.16', user_id: 1)
  end

  scenario "Should send a booking request", focus: true do
    create_user(user)
    sign_in(user)
    create_listing(listing)
    visit '/listings'
    puts page.body
    within('div#listing_13') do click_button('Request Booking') end
    expect(page).to have_current_path('/bookings/new')
    expect(page).to have_content('Ed Manor')
  end
end
