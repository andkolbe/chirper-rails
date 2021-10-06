# test_helper.rb loads the default configuration to run the tests 
require "test_helper"

# ChirpTest defines a test case because it inherits from ActiveSupport::TestCase
# ChirpTest has all of the methods available from ActiveSupport::TestCase
class ChirpTest < ActiveSupport::TestCase
  # test 'should not save chirp without content' do
  #   chirp = Chirp.new
  #   assert_not chirp.save
  # end

  # def test_the_truth
  #   assert true
  # end
end

# An assertion is a line of code that evaluates an object (or expression) for expected results.
# An assertion can check:
  # does this value = that value?
  # is this object nil?
  # is the user's password greater than 5 characters?
# Every test may contain one or more assertions, with no restrictions as to how many assertions are allowed
# Only when all the assertions are successful will the test pass