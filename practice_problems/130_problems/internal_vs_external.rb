factorial = Enumerator.new do |y|
  product = 1
  counter = 0
  loop do
    product = counter.zero? ? 1 : product * counter
    y << product
    counter += 1
  end
end

# 7.times { |_| puts factorial.next }
# 7.times { |_| puts factorial.next }
# factorial.rewind
# 7.times { |_| puts factorial.next }

factorial.each_with_index do |fac, index|
  puts fac
  break if index > 5
end