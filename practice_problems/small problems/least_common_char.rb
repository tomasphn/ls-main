# Write a method that takes a string as an argument and returns
# the character that occurs least often in the given string.
# If there are multiple characters with the equal lowest number
# of occurrences, then return the one that appears first in the
# string. When counting characters, consider the uppercase and
# lowercase version to be the same.

# write a method that takes a string as a single argument
# capitalize the whole string
# split the string into characters
# tally the occurences of each character
# find the minimum occurences out of those values
# find  the key of the minimum number of occurences
# return that key as a string

def least_common_char(str)
  occur = str.downcase.chars.tally
  occur.key(occur.values.min).to_s
end

p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'