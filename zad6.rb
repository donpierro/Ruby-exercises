class StringInquirer < String
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def method_missing(name)
    name[-1] != '?' ? super : name[0..-2].eql?(@data)
  end

  def respond_to_missing?(method_name, include_private = false)
    @data.eql?(method_name[0..-2].to_s)
  end
end