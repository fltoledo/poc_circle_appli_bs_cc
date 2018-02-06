
When(/I fill the signup form with email '(.*)' and password '(.*)'/) do |user_email, user_password|
	begin
		if user_email == 'auto'
			then 
				email = Utils.generate_random_email 
			else email = user_email
		end
		if user_password == 'auto'
			then password = 'ValidPassword9' 
			else password = user_password
		end
		@page.signUp_with(email, password)
	rescue => e
		fail "Error registering user. Error: #{e}"
	end
end

When(/I fill the signup form with valid '(.*)' and '(.*)'/) do |user_email, user_password|
	begin
		if user_email == 'auto'
			then 
				email = Utils.generate_random_email 
			else email = user_email
		end
		if user_password == 'auto'
			then password = 'ValidPassword9' 
			else password = user_password
		end
		@page.signUp_with(email, password)
	rescue => e
		fail "Error registering user. Error: #{e}"
	end
end

Then(/^I receive a signup error message saying '(.*)'$/) do |error_msg|
	begin
		@page.validate_error_message(error_msg) 
	rescue => e
		fail "Error registering user. Error: #{e}"
	end
end

