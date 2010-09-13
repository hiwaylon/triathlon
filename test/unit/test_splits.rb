require 'test_helper'

require 'splits'

class TestSplits < Test::Unit::TestCase
  should 'compute 400m pace' do
    splits = Splits.new("10:00")
    four_hundred = splits.split 400
    assert_equal four_hundred, "2:30"
  end
 
  should 'compute 800m pace' do
    splits = Splits.new("6:53")
    eight_hundred = splits.get_eight_hundred
    assert_equal eight_hundred.to_s, "3:27"
  end

  should 'compute 100m pace' do
    splits = Splits.new("5:00")
    one_hundred = splits.get_one_hundred
    assert_equal one_hundred.to_s, "0:19"
  end
  
  should 'return original pace' do
    splits = Splits.new("7:15")
    assert_equal splits.pace.to_s, "7:15"
  end
  
  should 'present time with seconds less than ten correctly' do
    splits = Splits.new("6:16")
    assert_equal splits.get_eight_hundred.to_s, "3:08"
  end
end