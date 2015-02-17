class StringInquirer < String
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

class TestClass
  def initialize(attribute)
    @attribute = attribute
  end

  def attribute
    StringInquirer.new(@attribute)
  end

  def respond_to_missing?(method_name, include_private = false)
    @attribute.eql?(method_name[0..-2].to_s)
  end
end