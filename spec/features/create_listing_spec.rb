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
