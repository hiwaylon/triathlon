module TimePresenter
  def present_hours_as_string(time)
    hours = time.floor
    fraction = time - hours
    minutes = (60.0 * fraction)
    minutes_string = minutes.floor.to_s
    minutes_string = "0#{minutes_string}" if minutes < 10.0 && hours > 0.0
    fraction = minutes - minutes.floor
    seconds = (60.0 * fraction)
    seconds_string = seconds.round.to_s
    seconds_string = "0#{seconds_string}" if seconds < 10.0
    if hours > 0.0
      "#{hours}:#{minutes_string}:#{seconds_string}"
    elsif minutes > 0.0
      "#{minutes_string}:#{seconds_string}"
    else
      "0:#{seconds_string}"
    end
  end
  def present_seconds_as_string(time_in_seconds)
    hours = time_in_seconds.to_f / 3600.0
    present_hours_as_string hours
  end
end