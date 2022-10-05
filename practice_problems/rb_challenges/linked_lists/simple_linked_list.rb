
class Element
  attr_reader :next, :datum

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end
  
class SimpleLinkedList
  def initialize
    @list = []
  end

  def empty?
    list.empty?
  end

  def size
    list.size
  end

  def peek
    return nil if list.empty?

    list[0].datum
  end

  def pop
    list.shift.datum
  end

  def push(datum)
    list.unshift(Element.new(datum, list[0]))
  end

  def self.from_a(array)
    new_list = new
    return new_list if array.nil? || array.empty?

    array.reverse.each { |num| new_list.push(num) }
    new_list
  end

  def to_a
    list.map { |el| el.datum }
  end

  def reverse
    SimpleLinkedList.from_a(self.to_a.reverse)
  end

  def head
    list[0]
  end

  protected

  attr_reader :list
end
