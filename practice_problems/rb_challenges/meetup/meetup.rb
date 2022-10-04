require 'date'

class Meetup
  TEENTHS = [13, 14, 15, 16, 17, 18, 19].freeze
  DAY_KEY = { sunday: 0, monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6 }.freeze
  SCHEDULE_KEY = { first: 1, second: 2, third: 3, fourth: 4, fifth: 5, last: 'last', teenth: 'teenth' }

  attr_accessor :year, :month, :date

  def initialize(year, month)
    @year = year
    @month = month
    @date = Date.new(year, month, 1)
  end

  def day(weekday, schedule)
    day_type = weekday.downcase.to_sym
    schedule_type = schedule.downcase.to_sym
    find_scheduled_day(day_type, schedule_type)
  end

  def find_scheduled_day(day_type, schedule_type)
    day_num = DAY_KEY[day_type]
    schedule_value = SCHEDULE_KEY[schedule_type]
    case schedule_value
    when (1..6)
      find_numbered(day_num, schedule_value)
    when 'last'
      find_last(day_num)
    when 'teenth'
      find_teenth(day_num)
    end
  end

  def find_numbered(day, number)
    found = 0
    next_month = find_next_month
    loop do
      found += 1 if date.wday == day
      return date if found >= number

      @date = date + 1
      return nil if date >= next_month
    end
  end

  def find_last(day)
    next_month = find_next_month
    last_found_date = nil
    loop do
      last_found_date = date if date.wday == day
      @date = date + 1
      return last_found_date if date == next_month
    end
  end

  def find_teenth(day)
    loop do
      return date if TEENTHS.include?(date.mday) && date.wday == day

      @date = date + 1
    end
  end

  def find_next_month
    new_date = date.dup
    loop do
      new_date += 1
      break if new_date.day == 1
    end
    new_date
  end
end
