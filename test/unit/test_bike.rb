# Test file must be in the test/ directory
# Test files must be in the form 'test_*.rb'
# Test class must begin with 'Test'
# Source: http://yardoc.org/docs/blackwinter-zentest/Autotest
require 'test_helper'

require 'bike'

class TestBike < Test::Unit::TestCase
  should "compute bike time from distance and speed" do
    distance = 24.8
    speed = 23.0
    bike = Bike.new(distance, speed)
    assert_in_delta(distance, bike.distance, 0.001)
    assert_in_delta(speed, bike.speed, 0.001)
    
    puts bike

    time = bike.compute_time
    expected_time = "1:04:42"
    p time
    assert_equal(expected_time, time)
  end
end
