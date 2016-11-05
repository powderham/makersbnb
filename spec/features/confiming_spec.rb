require 'web_helpers'
require 'spec_helper'

feature "Account page" do
  let(:user) do
    User.create(email: 'ed@gmail.com', password: 'admin', first_name: 'Ed', last_name: 'Test', username: 'Ed', id: 1)
  end

  let(:user1) do
    User.create(email: 'chad@gmail.com', password: 'admin', first_name: 'Chad', last_name: 'Tester', username: 'Chad', id: 2)
  end

  let(:listing1) do
      Listing.create(name: 'Chad Manor', description: 'Swampy', price: '30', date: '31.12.16', user_id: 2)
  end


scenario "should be able to see booking requests" do
  sign_in(user1)
  create_listing(listing1)
  sign_out
  sign_in(user)
  visit ("/listings")
  within('div#listing_10') do
    click_button('Request Booking')
  end
  sign_out
  sign_in(user1)
  visit("/users")
  expect(page).to have_content("Booked by: Ed Test")
end

end
