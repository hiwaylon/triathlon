require 'converter'
require 'time_presenter'
class Splits
  include TimePresenter
  def initialize(pace)
    pace_times = pace.split(':').map{|string| string.to_i}
    converter = Converter.new
    if pace_times.size == 3
      @total_pace_in_seconds = converter.hours_to_seconds(pace_times[0]) + converter.minutes_to_seconds(pace_times[1]) + pace_times[2]
    elsif pace_times.size == 2
      @total_pace_in_seconds = converter.minutes_to_seconds(pace_times[0]) + pace_times[1]
    else
      @total_pace_in_seconds = pace_times[0]
    end
  end
  
  def split(meters)
    ratio = meters.to_f / 1600.0
    split = @pace * ratio
    present_seconds_as_string split
  end

  def get_four_hundred()
    present_seconds_as_string @total_pace_in_seconds / 4.0
  end

  def get_eight_hundred()
    present_seconds_as_string @total_pace_in_seconds /  2.0
  end

  def get_one_hundred()
    present_seconds_as_string @total_pace_in_seconds / 16.0
  end

  def pace
    present_seconds_as_string @total_pace_in_seconds
  end
end
