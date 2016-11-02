require './app/models/user'
require 'web_helpers'
require 'spec_helper'

feature "Signing in" do
  scenario "Should be able to sign in" do
    create_user
    visit '/users/sign_in'
    fill_in('email', with: 'M.j.scrooge@aol.com')
    fill_in('password', with: 'disable_monkey_patching')
    click_button('Sign in')
    expect(page).to have_content "Welcome Humbug1"
  end
end
