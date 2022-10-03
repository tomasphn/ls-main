require 'pry'
class Clock
  MINUTES_IN_HOUR = 60
  HOURS_IN_DAY = 24

  attr_reader :hours, :minutes

  def initialize(hrs, mins)
    @hours = hrs
    @minutes = mins
  end

  def self.at(hrs, mins = 0)
    new(hrs, mins)
  end

  def +(mins)
    @minutes += mins
    adjust_time
    self
  end

  def -(mins)
    @minutes -= mins
    adjust_time
    self
  end

  def adjust_time
    @hours += minutes / MINUTES_IN_HOUR
    @minutes = minutes % MINUTES_IN_HOUR
    @hours -= HOURS_IN_DAY until hours < HOURS_IN_DAY
    @hours += HOURS_IN_DAY until hours >= 0
  end

  def to_s
    hrs = hours < 10 ? ('0' + hours.to_s) : hours.to_s
    mins = minutes < 10 ? ('0' + minutes.to_s) : minutes.to_s
    "#{hrs}:#{mins}"
  end

  def ==(other)
    hours == other.hours && minutes == other.minutes
  end
end
