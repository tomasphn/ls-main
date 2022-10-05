class CustomSet
  def initialize(array = [])
    @data = array.uniq
  end

  def empty?
    data.empty?
  end
  
  def contains?(el)
    data.include?(el)
  end

  def subset?(other_set)
    data.all? { |el| other_set.contains?(el) }
  end

  def disjoint?(other_set)
    data.none? { |el| other_set.contains?(el) }
  end

  def eql?(other_set)
    data.sort == other_set.data.sort
  end
  
  def add(el)
    data.push(el).uniq!
    self
  end

  def ==(other_set)
    data.sort == other_set.data.sort  
  end

  def intersection(other_set)
    intersection = data.select { |el| other_set.contains?(el) }
    CustomSet.new(intersection)
  end
  
  def difference(other_set)
    difference = data.select { |el| !other_set.contains?(el) }
    CustomSet.new(difference)
  end

  def union(other_set)
    union = data + other_set.data
    CustomSet.new(union)
  end

  protected

  attr_reader :data
end