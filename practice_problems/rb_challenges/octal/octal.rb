# base 8 number system
# treat INVALID INPUT AS OCTAL 0
# Rightmost digit gets mutliplied by 8^0, next to the left 8^1, etc. etc.
  # then sum all the products up

# class Octal
  # initializes with 1 property, @value, passed as an argument on creation
  # invalid input defaults to 0

# instance method: .to_decimal
# input: integer
# output: integer, octal version of number

class Octal
  def initialize(input)
    @value = invalid_input?(input) ? 0 : input.to_i
  end

  def to_decimal
    octal = @value.digits.map.with_index do |digit, indx|
      digit * (8**indx)
    end.sum
  end

  private

  def invalid_input?(input)
    input.to_i.digits.any? { |digit| digit >= 8 } || input =~ /[a-z]/
  end
end
