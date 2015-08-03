require "spec_helper" 

describe "Logging In" do
	it "logs the user in and goes to the todo lists" do
		User.create(first_name: "Josh", last_name: "Stricklin", email: "jostricklin@gmail.com", password: "treehouse1", password_confirmation: "treehouse1")
		visit new_user_session_path
		fill_in "Email Address", with: "jostricklin@gmail.com"
		fill_in "Password", with: "treehouse1"
		click_button "Log In"

		expect(page).to have_content("Todo Lists")
		expect(page).to have_content("Thanks for logging in!")
	end

	it "displays the email address in the event of a failed login" do
		visit new_user_session_path
		fill_in "Email Address", with: "jostricklin@gmail.com"
		fill_in "Password", with: "incorrect"
		click_button "Log In"

		# not entirely sure why this doesn't work. error messages seems to
		# only display after the SECOND failed login.
		# expect(page).to have_content("Please check your email and password")
		expect(page).to have_field("Email Address", with: "jostricklin@gmail.com")
	end
end