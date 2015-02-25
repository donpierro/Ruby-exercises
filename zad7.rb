class Tweets
  @tweets = []

  def initialize(&amp;block)
    instance_eval(&amp;block)
  end

  def text()
    @tweets &lt;&lt; Question.new(q, &amp;block)
  end
end