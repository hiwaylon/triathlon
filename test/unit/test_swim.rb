require 'test_helper'
require 'swim'

class TestSwim < Test::Unit::TestCase
  should 'construct correctly' do
    swim = Swim.new("1:40")
    pace = swim.pace
    assert_equal "1:40", pace
  end
  
  should 'split a new swim on the 50 correctly' do
    swim = Swim.new("2:00")
    split = swim.split(50)
    assert_equal split, "1:00"
  end
end