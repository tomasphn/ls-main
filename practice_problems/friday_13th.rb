#returns number of friday the 13ths in a year
#year is given as argument
#assume greater than 1752, using gregorian calendar
#returns single numeral
#OUTCASES 
#There are no friday the 13ths in given year
#Invalid year given?
#  no invalid year in test cases

#PLAN
#create method that takes a single argument: a year
#For all 12 months of a year
# Create date object for the 13th of each month of given year
# Check if it is a friday
#   Increment counter if it is a friday
#return number

require 'date'
def friday_13th(year)
  (1..12).count do |month|
    date = Date.new(year, month, 13)
    date.friday?
  end
end

p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2