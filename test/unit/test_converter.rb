require 'test_helper'

require 'converter'

class TestConverter < Test::Unit::TestCase
  should "convert hours to seconds" do
    converter = Converter.new
    seconds = converter.hours_to_seconds 1.083333333333333
    expected_seconds = 3900
    assert_in_delta(expected_seconds, seconds, 0.001)
  end
  should "convert minutes to seconds" do
    converter = Converter.new
    seconds = converter.minutes_to_seconds 38.566666666666667
    expected_seconds = 2314
    assert_in_delta(expected_seconds, seconds, 0.001)
  end
  should "convert miles per second to miles per hour" do
    converter = Converter.new
    mps = 0.006805555555556
    mph = converter.mps_to_mph mps
    expected_mph = 24.5
    assert_in_delta(expected_mph, mph, 0.001)
  end
  
  should 'convert a time string to seconds' do
    converter = Converter.new
    seconds = converter.string_to_seconds "1:45"
    expected_seconds = 105
    assert expected_seconds == seconds
    seconds = converter.string_to_seconds "5:44"
    expected_seconds = 344
    assert expected_seconds == seconds
  end
end