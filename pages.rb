require 'page-object'
class MainPage
  include PageObject

  page_url('http://upwork.com')

  text_field(:search_box, id: 'q')

  def magnifying_glass
      find_element(:css, '.glyphicon.air-icon-arrow-expand').click
  end

  def onto_freelancers 
      find_element(:css, '[data-qa="freelancer_value"]').click
  end

  def enter
      action.send_keys(:enter).perform
  end

end

class ResultPage
  include PageObject

  def some_thing  
      elements = browser.find_elements(:css, '.air-card-hover')

      elements.each { |element| 
      text_title = element.find_element(:css, '.m-0.freelancer-tile-title.ellipsis').text
      text_overview = element.find_element(:css, '.p-0-left.m-0').text

      elements = element.find_elements(:css, '.o-tag-skill')
            elements.each { |element| 
            text_skills = element.text
            puts text_skills
            }
      puts "-------------------------------"
      }
  end

end
