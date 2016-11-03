require './app/models/listing'
require 'spec_helper'

feature "Submit listing" do

  let(:user) do
    User.create(email: 'ed@gmail.com', password: 'admin', first_name: 'Ed', last_name: 'Test', username: 'Ed', id: 1)
  end

  scenario "Should be able to submit a listing" do
    create_user(user)
    sign_in(user)
    visit '/listings/new'
    fill_in('name', with: "Bates Motel")
    fill_in('description', with: "Very very nice")
    fill_in('price', with: 10)
    click_button('submit')
    expect(page).to have_content("Bates Motel")
    expect(page).to have_content("Very very nice")
    expect(page).to have_content("£10")
  end
end

feature "Submit listing" do
  scenario "Should be able to submit a listing" do
    visit '/listings'
    click_button('Add new listing')
    expect(page).to have_current_path('/listings/new')

  end
end

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
    within('div#listing_11') do click_button('Request Booking') end
    expect(page).to have_current_path('/bookings/new')
    expect(page).to have_content('Booking request sent!')
    click_button('Return to listings')
    expect(page).to have_current_path('/listings')
  end
end
