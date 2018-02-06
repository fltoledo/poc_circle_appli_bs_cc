include Selenium

class Utils
	
	# Method to generate a random email to test
	def self.generate_random_email
		random_email = rand(36**10).to_s(36) + "@therealreal.com"
		puts "Email to be used : " +random_email
		random_email
	end

	def self.get_browserstack_configuration (browserName)

		caps = WebDriver::Remote::Capabilities.new
		caps[:os] = "Windows"
		caps[:name] = "Watir"
		caps[:browser] = browserName
		caps[:browser_version] = "50"
		caps["browserstack.debug"] = "true"
		
		#caps[:browserName] = 'iPhone'
		#caps['device'] = 'iPhone 7'
		#caps['realMobile'] = 'true'
		#caps['os_version'] = '10.3'
		
		browserstack_user = "federicotoledo1"
		browserstack_key = "Wq1hqHqXTcjmpQmAzZ9o"

		$browser = Watir::Browser.new(:remote,
					:url => "http://"+browserstack_user+":"+browserstack_key+"@hub-cloud.browserstack.com/wd/hub",
					:desired_capabilities => caps)

	end
end