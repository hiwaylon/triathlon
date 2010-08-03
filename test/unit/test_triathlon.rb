# Test file must be in the test/ directory
# Test files must be in the form 'test_*.rb'
# Test class must begin with 'Test'
# Source: http://yardoc.org/docs/blackwinter-zentest/Autotest
require 'test_helper'

require 'converter'

class BikeRace
  def initialize
    @converter = Converter.new
  end
  def compute_speed(distance, time, *options)
    # todo - could construct with the time unit and thus hold a conversion strategy
    time_in_seconds = time
    unless options.empty?
      options_hash = options[0]
      if options_hash[:time_unit] == :hours
        time_in_seconds = @converter.convert_hours_to_seconds time
      elsif options_hash[:time_unit] == :minutes
        time_in_seconds = @converter.convert_minutes_to_seconds time
      end
    end
    
    speed_in_miles_per_second = distance / time_in_seconds
    converter.convert_mps_to_mph speed_in_miles_per_second
  end
  
  def compute_time(distance, speed)
    distance * (60.0 / speed) # assume speed in mph, convert to mpm
  end
end

class TestTriathlon < Test::Unit::TestCase
  should "compute bike speed" do
    distance = 14.5
    time = 2400 # default is time in seconds
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
  
  should "compute mph given time in hours" do
    # 75 minutes = 24.8 miles at x miles/hour
    distance = 24.8
    time = 1.25 # 1:15, an hour and fifteen minutes
    bikeRace = BikeRace.new
    mph = bikeRace.compute_speed(distance, time, :time_unit => :hours)
    expected_mph = 19.84
    assert_in_delta(expected_mph, mph, 0.001)
  end
  
  should "compute mph given time in minutes" do
    distance = 14.5
    time = 41.43
    bikeRace = BikeRace.new
    mph = bikeRace.compute_speed(distance, time, :time_unit => :minutes)
    expected_mph = 21.0
    assert_in_delta(expected_mph, mph, 0.001)
  end
end
