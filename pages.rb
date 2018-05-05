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
