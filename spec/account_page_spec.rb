require 'web_helpers'
require 'spec_helper'

feature "Account page" do
  let(:user) do
    User.create(email: 'ed@gmail.com', password: 'admin', first_name: 'Ed', last_name: 'Test', username: 'Ed', id: 1)
  end

  let(:listing) do
    Listing.create(name: 'Ed Manor', description: 'Woodsy', price: '10', date: '31.12.16', user_id: 1)
  end


  scenario "Should show listings created by the user" do
    visit '/users'
    sign_in(user)
    expect(page).to have_content "Welcome Ed"
    create_listing
    expect(page).to have_content "Bates Motel"
  end
end
