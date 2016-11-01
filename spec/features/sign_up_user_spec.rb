require './app/models/user'
require 'spec_helper'

feature "Sign up user" do
  scenario "Should be able to sign a user up" do
    visit '/users/new'
    fill_in('first_name', with: "Michael")
    fill_in('last_name', with: "Scrooge")
    fill_in('username', with: "Humbug1")
    fill_in('email', with: "M.j.scrooge@aol.com")
    fill_in('password', with: "disable_monkey_patching")
    click_button('submit')
    expect(page).to have_content("Welcome Humbug1")
  end
end
