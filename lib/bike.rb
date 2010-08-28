require 'converter'

class Bike
  def initialize
    @converter = Converter.new
  end
  def compute_speed(distance, time, *options)
    # todo - could construct with the time unit and thus hold a conversion strategy
    time_in_seconds = time
    unless options.empty?
      options_hash = options[0]
      if options_hash[:time_unit] == :hours
        time_in_seconds = @converter.hours_to_seconds time
      elsif options_hash[:time_unit] == :minutes
        time_in_seconds = @converter.minutes_to_seconds time
      end
    end
    
    speed_in_miles_per_second = distance / time_in_seconds
    @converter.mps_to_mph speed_in_miles_per_second
  end
  
  def compute_time(distance, speed)
    distance * (60.0 / speed) # assume speed in mph, convert to mpm
  end
end

