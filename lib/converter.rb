class Converter
  SecondsPerHour = 3600
  SecondsPerMinute = 60
  
  def hours_to_seconds(hours)
    hours * SecondsPerHour
  end
  
  def minutes_to_seconds(minutes)
    minutes * SecondsPerMinute
  end
  
  def mps_to_mph(mps)
    mps * SecondsPerHour
  end
  
  def string_to_seconds(time_string)
    pace_times = time_string.split(':').map{|string| string.to_i}
    converter = Converter.new
    if pace_times.size == 3
      @total_pace_in_seconds = converter.hours_to_seconds(pace_times[0]) + converter.minutes_to_seconds(pace_times[1]) + pace_times[2]
    elsif pace_times.size == 2
      @total_pace_in_seconds = converter.minutes_to_seconds(pace_times[0]) + pace_times[1]
    else
      @total_pace_in_seconds = pace_times[0]
    end
  end
end
