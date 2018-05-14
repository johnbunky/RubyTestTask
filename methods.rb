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

def self.goto_url
  puts 'go to www.upwork.com' 
  @main_page.goto; sleep 15
  #browser.manage.timeouts.page_load = 15
  #@wait.until {browser.execute_script(document.readyState === 'complete')}
end

def self.enter_keyword_for_freelancer
  puts 'focus onto find freelancers'
  @main_page.magnifying_glass
  @main_page.onto_freelancers

  puts 'enter keyword'
  @main_page.search_box = @keyword
  @main_page.enter
end

def self.chech_results
  puts 'get results and stdout freelancers with keyword:'
  @result_page.get_results(@keyword)
end

def self.choose_randome_profile
  puts 'choose randome profile'
  @result_page.random_profile
end

def self.etc
  # TODO
end

def self.after_test
  @browser.quit 
end

end
