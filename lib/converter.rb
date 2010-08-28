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
end
