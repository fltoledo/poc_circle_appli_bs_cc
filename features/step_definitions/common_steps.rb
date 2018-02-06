Given(/^a new '(.*)' browser in '(.*)'$/) do |browserName, where| 
	begin
		case where
			when 'cloud'
				$browser = Utils.get_browserstack_configuration(browserName)
			when 'local'
				case browserName
					when "firefox"
						$browser = Watir::Browser.new :firefox
					when "ie"
						$browser = Watir::Browser.new :ie
					when "safari"
						#To-Do: verify that it is running in Mac
						$browser = Watir::Browser.new :safari, technology_preview: true
					when "edge"
						$browser = Watir::Browser.new :edge
					else
						$browser = Watir::Browser.new :chrome
				end
			$browser.window.maximize
		end
	rescue => e
		fail "Error opening browser. Error : #{e}"
	end
end

Given(/^I navigate to The RealReal homepage$/) do
	begin
        $browser.goto "https://staging.therealreal.com"
        @page = SignupPage.new $browser
		fail "We are not in HomePage!" unless @page.loaded?
	rescue => e
		fail "Error opening page. Error : #{e}"
	end
end

Given (/I am logged in the site/) do
	begin
		$browser.goto "https://staging.therealreal.com"
        @page = SignupPage.new $browser
		fail "We are not in HomePage!" unless @page.loaded?
		email = Utils.generate_random_email 
		password = 'ValidPassword9'
		@page.signUp_with(email, password)
		@page = HomePage.new $browser
		@page.loaded?
	rescue => e
		fail "Error opening page. Error : #{e}"
	end
end

Then('The home page is loaded') do 
	begin
		@page = HomePage.new $browser
		@page.loaded?
	rescue => e
		fail "Error registering user. Error: #{e}"
	end
end
  