require 'selenium-webdriver'
require_relative 'pages.rb'

keyword = 'keyword'

# run chrome browser
browser = Selenium::WebDriver.for:chrome
main_page = MainPage.new(browser)


# clear browser cookies
browser.manage.delete_all_cookies

# go to www.upwork.com 
main_page.goto

main_page.magnifying_glass
main_page.onto_freelancers
main_page.search_box = keyword
main_page.enter

browser.quit 
