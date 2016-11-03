def create_user(user)
  visit '/users/new'
  fill_in('first_name', with: user.first_name)
  fill_in('last_name', with: user.last_name)
  fill_in('username', with: user.username)
  fill_in('email', with: user.email)
  fill_in('password', with: user.password)
  click_button('submit')
end

def sign_in(user)
  visit '/users/sign_in'
  fill_in('email', with: user.email)
  fill_in("password", with: user.password)
  click_button('Sign in')
end

def sign_out
  visit '/users/sign_out'
  click_button('Sign out')
end

def create_listing(listing)
  visit '/listings/new'
  fill_in('name', with: listing.name)
  fill_in('description', with: listing.description)
  fill_in('price', with: listing.price)
  click_button('submit')
end
