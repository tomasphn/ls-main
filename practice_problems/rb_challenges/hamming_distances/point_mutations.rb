class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(second_strand)
    strand1, strand2 = shorten_strands(strand, second_strand)
    count = 0
    strand1.each_with_index do |char, index|
      count += 1 if char != strand2[index]
    end
    count
  end

  private

  def shorten_strands(strand1, strand2)
    length = strand1.length > strand2.length ? strand2.length : strand1.length
    [strand1.slice(0, length).chars, strand2.slice(0, length).chars]
  end
end
