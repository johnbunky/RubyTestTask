
require_relative 'methods.rb'

class SampleTest

# run test in chrome browser
run_chrome
before_test
test_run
after_test

# run test in firefox browser
run_firefox
before_test
test_run
after_test

end
