require 'converter'
require 'time_presenter'
class Bike
  attr_accessor :distance, :speed
  include TimePresenter
  def initialize(distance, speed)
    self.distance = distance.to_f
    self.speed = speed.to_f
  end

  def compute_time 
    time = distance / speed # time in hours
    present_hours_as_string(time)
  end
  
  def to_s
    p distance
    p speed
  end
end

