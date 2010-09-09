require 'converter'

class TimePresenter
  def self.present_hours_as_string(time)
    hours = time.floor
    fraction = time - hours
    minutes = (60.0 * fraction)
    minutes_string = minutes.floor.to_s
    minutes_string = "0#{minutes_string}" if minutes < 10.0
    fraction = minutes - minutes.floor
    seconds = (60.0 * fraction)
    seconds_string = seconds.round.to_s
    seconds_string = "0#{seconds_string}" if seconds < 10.0
    "#{hours}:#{minutes_string}:#{seconds_string}"
  end
end

class Bike
  attr_accessor :distance, :speed

  def initialize(distance, speed)
    self.distance = distance.to_f
    self.speed = speed.to_f
  end

  def compute_time 
    time = distance / speed # time in hours
    TimePresenter.present_hours_as_string(time)
  end
  
  def to_s
    p distance
    p speed
  end
end

