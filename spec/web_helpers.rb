def create_user
  visit '/users/new'
  fill_in('first_name', with: "Michael")
  fill_in('last_name', with: "Scrooge")
  fill_in('username', with: "Humbug1")
  fill_in('email', with: "M.j.scrooge@aol.com")
  fill_in('password', with: "disable_monkey_patching")
  click_button('submit')
end
