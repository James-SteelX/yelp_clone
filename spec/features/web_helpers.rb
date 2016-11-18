def sign_in
  visit('/')
  click_link('Sign in')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  click_button('Sign in')
end

def sign_up(email = 'test@example.com')
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_out
  visit('/')
  click_link('Sign out')
end

def add_restaurant(name = 'KFC')
  visit('restaurants/new')
  fill_in('Name', with: name)
  click_button('Create Restaurant')
end
