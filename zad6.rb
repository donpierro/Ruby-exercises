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
  def initialize(attribute)
    @attribute = attribute
  end

  def attribute
    CompareStringValue.new(@attribute)
  end

  def respond_to_missing?(method_name, include_private = false)
    @attribute.eql?(method_name[0..-2].to_s)
  end
end

abc = Test.new("initial")
puts abc.attribute.name?
puts abc.attribute.initial?
puts abc.attribute.s?

puts abc.respond_to?('initial?')
puts abc.respond_to?('initialwqwe?')