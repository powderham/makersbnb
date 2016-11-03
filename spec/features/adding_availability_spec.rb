require './app/models/listing'
require 'spec_helper'

feature "Dates"do
let(:user) do

  User.create(email: 'ed@gmail.com', password: 'admin', first_name: 'Ed', last_name: 'Test', username: 'Ed', id: 1)
end
let(:listing) do
  Listing.create(name: 'Ed Manor', description: 'Woodsy', price: '10', date: '31.12.16', user_id: 1)
end

  scenario "Can add an available date to a listing" do
    sign_in(user)
    create_listing(listing)
    visit "/users"
    within("div#home_8") do
      fill_in "available_date", with: "2016-11-11"
      click_button("Add availability")
    end
    expect(page).to have_content ("11 Nov 2016")
  end
end
