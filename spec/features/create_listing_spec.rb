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
    expect(page).to have_content("Very very nice")
    expect(page).to have_content("£10")
  end
end

feature "Submit listing" do
  scenario "Should be able to submit a listing" do
    DatabaseCleaner.clean
    visit '/listings'
    click_button('Add new listing')
    expect(page).to have_current_path('/listings/new')

  end
end
