require 'test_helper'

require 'splits'

class TestSplits < Test::Unit::TestCase
  should 'return split as a string' do
    split = SplitPresenter.new(430)
    assert_equal split.to_s, "7:10"
  end

  should 'compute 400m pace' do
    splits = Splits.new("10:00")
    fourHundred = splits.getFourHundred
    assert_equal fourHundred.to_s, "2:30"
  end
 
  should 'compute 800m pace' do
    splits = Splits.new("6:53")
    eightHundred = splits.getEightHundred
    assert_equal eightHundred.to_s, "3:27"
  end

  should 'compute 100m pace' do
    splits = Splits.new("5:00")
    oneHundred = splits.getOneHundred
    assert_equal oneHundred.to_s, "0:19"
  end
end