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

  def get_results(keyword)
  @profiles = nil
  result_array = []
      # get web elements (profiles) collection 
      @profiles = browser.find_elements(:css, '.air-card-hover')
      # web elements (profiles) loop
      @profiles.each { |profile| 
               # get text of title and overview
               title = profile
               .find_element(:css, 'h4.m-0.freelancer-tile-title').text
               overview = profile.find_element(:css, '.p-0-left.m-0').text
               
                @keyword_exist = false

               # get web elements (skills) collection
               skills = profile.find_elements(:css, '.o-tag-skill')
               # create hash of skills
               skills_hash = Hash.new()
               temp = 0
               # web elements (skills) loop
               skills.each { |element| 
                       # get text of skill
                       skill = element.text
                       # add skill to hash
                       skills_hash[temp] = skill
                       temp = temp + 1
               # check if keyword exist in skill       
               if (skill.include? keyword) && !@keyword_exist 
                   @keyword_exist = true
               end 
                }
       # add title, overview and hash of skills to hash
       hash = { :title => title, :overview => overview, :skills => skills_hash }
       result_array.push(hash)
       # check if keyword exist in title      
       if (title.include? keyword) && !@keyword_exist 
           @keyword_exist = true
       end 
       # check if keyword exist in overview       
       if (overview.include? keyword) && !@keyword_exist 
           @keyword_exist = true
       end 

       if @keyword_exist
            puts ' keyword exists '
       else
            puts ' keyword does not exist '
       end
       }
  end
  def random_profile
       number = @profiles.length
       @profiles[rand number].click
  end
end

class ProfilePage
  include PageObject
  
  def method
    # TODO
  end
end


