require 'selenium-webdriver'
require_relative 'pages.rb'

class SampleTest

@keyword = 'Selenium'

def self.run_chrome
  @browser = Selenium::WebDriver.for:chrome
end

def self.run_firefox
  @browser = Selenium::WebDriver.for:firefox
end

def self.before_test
  #@wait = Selenium::WebDriver::Wait.new(:timeout => 20)
  @main_page = MainPage.new(@browser)
  @result_page = ResultPage.new(@browser)

  # clear browser cookies
  @browser.manage.delete_all_cookies
end

def self.test_run

  # go to www.upwork.com 
  @main_page.goto; sleep 15
  #browser.manage.timeouts.page_load = 15
  #@wait.until {browser.execute_script(document.readyState === 'complete')}

  # focus onto find freelancers
  @main_page.magnifying_glass
  @main_page.onto_freelancers

  # enter keyword
  @main_page.search_box = @keyword
  @main_page.enter

  # get results and stdout freelancers with keyword
  @result_page.get_results(@keyword)

  #choose randome profile
  @result_page.random_profile
end

def self.after_test
  @browser.quit 
end

# run test in chrome browser
run_chrome
before_test
test_example
after_test

# run test in firefox browser
run_firefox
before_test
test_example
after_test

end
