class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    raise ArgumentError.new "Not Valid Triangle" unless valid_triangle?
  end

  def kind
    if equilateral?
      'equilateral'
    elsif isosceles?
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def all_sides?
    [@side1, @side2, @side3].each do |side|
      return false unless yield(side)
    end
    true
  end

  def valid_triangle?
    all_sides? { |side| side > 0 } &&
      @side1 + @side2 > @side3 && @side2 + @side3 > @side1 && @side1 + @side3 > @side2
  end

  def equilateral?
    all_sides? { |side| @side1 == side }
  end

  def isosceles?
    @side1 == @side2 || @side1 == @side3 || @side2 == @side3
  end
end