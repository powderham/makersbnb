require './app/models/listing'
require 'spec_helper'

feature "Submit listing" do
  scenario "Should be able to submit a listing" do
    DatabaseCleaner.clean
    visit '/listings/new'
    fill_in('name', with: "Bates Motel")
    fill_in('description', with: "Very very nice")
    fill_in('price', with: 10)
    click_button('submit')
    expect(page).to have_content("Bates Motel")
  end
end
