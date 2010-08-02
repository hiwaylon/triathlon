# Test file must be in the test/ directory
# Test files must be in the form 'test_*.rb'
# Test class must begin with 'Test'
# Source: http://yardoc.org/docs/blackwinter-zentest/Autotest
require 'test_helper'

class BikeRace
  def compute_speed(distance, time)
    distance / (time / 60.0) # assumes distance is miles and time is minutes
  end
  
  def compute_time(distance, speed)
    distance * (60.0 / speed) # assume speed in mph, convert to mpm
  end
end

class TestTriathlon < Test::Unit::TestCase
  def test_compute_bike_speed
    distance = 14.5
    time = 40.0
    bikeRace = BikeRace.new
    mph = bikeRace.compute_speed distance, time
    expected_mph = 21.75
    assert_in_delta(expected_mph, mph, 0.001)
  end
  
  should "compute ride time given speed and distance" do
    distance = 24.8
    speed = 23.0
    bikeRace = BikeRace.new
    time = bikeRace.compute_time distance, speed
    expected_time = 64.695652173913043
    assert_in_delta(expected_time, time, 0.001)
  end
end
