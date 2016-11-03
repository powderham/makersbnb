require 'web_helpers'
require 'spec_helper'

feature "Account page" do
  let(:user) do
    User.create(email: 'ed@gmail.com', password: 'admin', first_name: 'Ed', last_name: 'Test', username: 'Ed', id: 1)
  end

  let(:user1) do
    User.create(email: 'chad@gmail.com', password: 'admin', first_name: 'Chad', last_name: 'Tester', username: 'Chad', id: 2)
  end

  let(:listing) do
    Listing.create(name: 'Ed Manor', description: 'Woodsy', price: '10', date: '31.12.16', user_id: 1)
  end

  let(:listing1) do
    Listing.create(name: 'Chad Manor', description: 'Swampy', price: '30', date: '31.12.16', user_id: 2)
  end


  scenario "Should show listings created by the user" do
    sign_in(user)
    expect(page).to have_content "Welcome Ed"
    create_listing(listing)
    expect(page).to have_content "Ed Manor"


  end

  scenario "Should not show listings created by another user" do
    sign_in(user1)
    create_listing(listing1)
    puts page.body
    expect(page).to have_content "Chad Manor"
    expect(page).not_to have_content "Ed Manor"
    sign_out

  end
end
