class SendTweet
  attr_reader :tweet

  def initialize(&block)
    @tweet = ""
    self.instance_eval(&block) if block_given?
    print @tweet
  end

  def text(message)
    @tweet += message
  end

  def hashtag(tag)
    @tweet += %( ##{tag})
  end

  def mention(author)
    @tweet += %( @#{author})
  end
end