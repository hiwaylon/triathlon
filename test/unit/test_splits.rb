require 'test_helper'

require 'splits'

class TestSplits < Test::Unit::TestCase
  should 'return split as a string' do
    split = SplitPresenter.new(430)
    assert_equal split.to_s, "7:10"
  end

  should 'compute 400m pace' do
    splits = Splits.new("10:00")
    four_hundred = splits.get_four_hundred
    assert_equal four_hundred.to_s, "2:30"
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
end