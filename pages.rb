require 'page-object'
class MainPage
  include PageObject

  result_array = []
  keyword_exist = false

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

class ResultPage        # do refactor !!!!!!!
  include PageObject

  def get_results(keyword)

  result_array = []

      elements = browser.find_elements(:css, '.air-card-hover')
      elements.each { |element| 
               title = element
               .find_element(:css, '.m-0.freelancer-tile-title.ellipsis').text
               overview = element.find_element(:css, '.p-0-left.m-0').text
               
               elements = element.find_elements(:css, '.o-tag-skill')
               skills_array = Hash.new()
               temp = 0
               elements.each { |element| 
                       skill = element.text
                       skills_array[temp] = skill
                       temp = temp + 1

                       if skill.include? keyword
                          keyword_exist = true
                       end
                }
       hash = { :title => title, :overview => overview, :skills => skills_array }
       result_array.push(hash)

       if title.include? keyword
          keyword_exist = true
       end

       if overview.include? keyword
          keyword_exist = true
       end

       if keyword_exist
          puts ' keyword exist '
       end

       }
       # puts result_array[2][:skills][0]
  end
end

class ProfilePage
  include PageObject
  
  def method
    # TODO
  end
end


