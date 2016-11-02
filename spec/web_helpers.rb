def create_user
  visit '/users/new'
  fill_in('first_name', with: "Michael")
  fill_in('last_name', with: "Scrooge")
  fill_in('username', with: "Humbug1")
  fill_in('email', with: "M.j.scrooge@aol.com")
  fill_in('password', with: "disable_monkey_patching")
  click_button('submit')
end

def sign_in(user)
  visit '/users/sign_in'
  fill_in('email', with: user.email)
  fill_in("password", with: user.password)
  click_button('Sign in')
end


def create_listing(listing)
  visit '/listings/new'
  fill_in('name', with: "Bates Motel")
  fill_in('description', with: "Very very nice")
  fill_in('price', with: 10)
  click_button('submit')
end
