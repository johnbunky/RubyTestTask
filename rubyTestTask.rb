require 'selenium-webdriver'

browser = Selenium::WebDriver.for:chrome
#browser = Selenium::WebDriver.for:firefox

browser.get "http://upwork.com" 
sleep 5
browser.quit  
