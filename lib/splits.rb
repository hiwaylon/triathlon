require 'converter'

class SplitPresenter
  def initialize(seconds)
    @total_seconds = seconds.to_f
  end
  
  def to_s
    if @total_seconds > 3600.0
      return 'NYI'
    end

    minutes = (@total_seconds / 60.0).truncate
    seconds = (@total_seconds - (minutes * 60.0)).round
    return "#{minutes}:#{seconds}"
  end
  
end

class Splits
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
  
  def get_four_hundred()
    return SplitPresenter.new(@total_pace_in_seconds / 4.0)
  end

  def get_eight_hundred()
    return SplitPresenter.new(@total_pace_in_seconds / 2.0)
  end

  def get_one_hundred()
    return SplitPresenter.new(@total_pace_in_seconds / 16.0)
  end

  def pace
    return SplitPresenter.new(@total_pace_in_seconds)
  end
end
