require 'selenium-webdriver'
require_relative 'pages.rb'

keyword = 'Selenium'

# run chrome browser
browser = Selenium::WebDriver.for:chrome
# wait = Selenium::WebDriver::Wait.new(:timeout => 10)
main_page = MainPage.new(browser)
result_page = ResultPage.new(browser)

# clear browser cookies
browser.manage.delete_all_cookies

# go to www.upwork.com 
main_page.goto; sleep 10

# focus onto find freelancers
main_page.magnifying_glass
main_page.onto_freelancers

# enter keyword
main_page.search_box = keyword
main_page.enter

# get results and stdout freelancers with keyword
result_page.get_results(keyword)

#choose randome profile
result_page.random_profile

browser.quit 
