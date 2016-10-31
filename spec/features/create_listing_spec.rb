require './app/models/listing'
require 'spec_helper'

feature "Submit listing" do
  scenario "Should be able to submit a listing" do
    # DatabaseCleaner.clean
    Listing.create(name: "Bates Motel", description: "Very very nice", price: 10)
    visit '/listings'
    expect(page).to have_content("Bates Motel")
  end
end
