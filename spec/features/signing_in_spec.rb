require './app/models/user'
require 'web_helpers'
require 'spec_helper'

feature "Signing in" do

  let(:user) do
    User.create(email: 'ed@gmail.com', password: 'admin', first_name: 'Ed', last_name: 'Test', username: 'Ed', id: 1)
  end
  
  scenario "Should be able to sign in" do
    create_user(user)
    visit '/users/sign_in'
    fill_in('email', with: 'ed@gmail.com')
    fill_in('password', with: 'admin')
    click_button('Sign in')
    expect(page).to have_content "Welcome Ed"
  end
end
