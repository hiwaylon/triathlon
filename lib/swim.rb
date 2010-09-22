require 'converter'
require 'time_presenter'
class Swim
  include TimePresenter
  def initialize(pace_string, distance=0.0)
    converter = Converter.new
    @pace = converter.string_to_seconds pace_string
    @distance = distance
  end
  
  def split(split_distance)
    ratio = split_distance.to_f / 100.0
    split = @pace * ratio
    present_seconds_as_string split
  end
  
  def pace
    present_seconds_as_string @pace
  end
  
  def distance
    @distance
  end

  def compute_time(distance=@distance)
    hundreds = distance.to_f / 100.0
    time_in_seconds = @pace * hundreds
    present_seconds_as_string time_in_seconds
  end
private
  def pace=(pace)
    @pace = pace.to_f
  end
  def distance=(distance)
    @distance = distance.to_f
  end
end