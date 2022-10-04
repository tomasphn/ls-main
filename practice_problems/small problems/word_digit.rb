def word_to_digit(str)
  nums = { one: '1', two: '2', three: '3', four: '4', five: '5', six: '6', seven: '7', eight: '8', nine: '9'}
  nums.keys.each do |key|
    str.gsub!(key.to_s, nums[key])
  end
  str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')