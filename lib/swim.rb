require 'converter'
require 'time_presenter'
class Swim
  include TimePresenter
  def initialize(pace_string)
    converter = Converter.new
    @pace = converter.string_to_seconds pace_string
  end
  
  def split(split_distance)
    ratio = split_distance.to_f / 100.0
    split = @pace * ratio
    present_seconds_as_string split
  end
  
  def pace
    present_seconds_as_string @pace
  end

private
  def pace=(pace)
    @pace = pace.to_f
  end
end