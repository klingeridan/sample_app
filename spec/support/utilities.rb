include ApplicationHelper

def valid_signin(user)
	fill_in "Email", 		with: user.email.upcase
	fill_in "Password", 	with: user.password
	click_button "Sign in"

	# cookies[:remember_token] = user.remember_token
end

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		page.should have_selector('div.alert.alert-error', text: 'Invalid')
	end
end

def fill_valid_user_details_in_create_user_form
	fill_in "Name", 		with: "Example User"
	fill_in "Email", 		with: "user@example.com"
	fill_in "Password", 	with: "foobar"
	fill_in "Confirmation", with: "foobar"
end

def create_valid_user
	FactoryGirl.create(:user)
end

def sign_in(user)
  visit signin_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end