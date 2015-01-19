class String
  def text_palindrom?
    self.reverse == self
  end
end

class Fixnum
  def palindrom?
    self < 0 ? false : self.to_s.text_palindrom?
  end
  def bin_palindrom?
    self < 0 ? false : self.to_s(2).text_palindrom?
  end
  def sum_palindroms
    (1..self).select{ |val| val.palindrom? && val.bin_palindrom? }.inject(:+)
  end
end

puts (999999).sum_palindroms