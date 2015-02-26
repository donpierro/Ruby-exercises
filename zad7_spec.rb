require './zad7.rb'

describe 'SendTweet' do

  before(:each) do
    @example = SendTweet.new do
      text "I've just learnt how to write DSL in Ruby! Whoa!"
      hashtag "DSL"
      hashtag "Ruby"
      mention "yukihiro_matz"
    end
  end

  it "prints tweet with hashtags and author" do
    expected_tweet = "I've just learnt how to write DSL in Ruby! Whoa! #DSL #Ruby @yukihiro_matz"
    expect(@example.tweet).to eql(expected_tweet)
  end
end