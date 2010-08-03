class Converter
  SecondsPerHour = 3600
  SecondsPerMinute = 60
  def convert_hours_to_seconds(hours)
    hours * SecondsPerHour
  end
  def convert_minutes_to_seconds(minutes)
    minutes * SecondsPerMinute
  end
  def convert_mps_to_mph(mps)
    mps * SecondsPerHour
  end
end
