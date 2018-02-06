require 'fileutils'

class PageBase
    include PageObject

    def screenshot
        time = Time.new
        dirname = "./screenshots/"
        FileUtils.mkdir_p(dirname) #creates the directory if it does not exist
        imageName = dirname + 'result_' + time.strftime('%Y%m%d_%H%M%S') + '.png'
        $browser.driver.save_screenshot(imageName);
    end

end