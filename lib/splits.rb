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
    split = @total_pace_in_seconds * ratio
    present_seconds_as_string split
  end
  def pace
    present_seconds_as_string @total_pace_in_seconds
  end
end
