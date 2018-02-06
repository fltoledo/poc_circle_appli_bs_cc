Feature: Sign up 

	Background:
		Given a new 'firefox' browser in 'local'
		#Given a new 'chrome' browser in 'cloud'

	# POSITIVE

	@test_case @ignore
	Scenario: Sign up with a non existing email 
		Given I navigate to The RealReal homepage
		When I fill the signup form with email 'auto' and password 'auto'
        Then The home page is loaded

	# NEGATIVE

	#@ignore
	Scenario: Sign up with an existing email 
		Given I navigate to The RealReal homepage
		When I fill the signup form with email 'mm_crm@therealreal.com' and password 'ValidPassword9'
        Then I receive a signup error message saying 'Email has already been taken'

	Scenario: Check email formating
		Given I navigate to The RealReal homepage
		When I fill the signup form with email 'mm_crm' and password 'wrong-12345'
        Then I receive a signup error message saying 'Please include an'