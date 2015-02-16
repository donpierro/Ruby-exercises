class CompareStringValue < String
  def initialize(attribute)
    @attribute = attribute
  end

  def method_missing(name, *args, &block)
    if name[-1] != '?'
      raise NoMethodError, %(undefined method #{name})
    else
      name[0..-2].eql?(@attribute)
    end
  end
end

class Test
  def initialize(status)
    @status = status
  end

  def status
    CompareStringValue.new(@status)
  end
end

abc = Test.new("initial")
puts abc.status.name?
puts abc.status.initial?
puts abc.status.s?