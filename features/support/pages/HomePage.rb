
require_relative 'PageBase'
class HomePage < PageBase
    
    link(:welcomeMsg, :css => 'div.head-utility-row__member-msg > a')
    text_field(:search_box, :id => 'action')


    def loaded?
        self.welcomeMsg?
        self.welcomeMsg_element.text.include?("get free 2-day shipping upgrades.")
    end

    def search keyword
        self.search_box?
        self.search_box_element.click
        self.search_box = keyword
        $browser.send_keys :enter
    end


  end