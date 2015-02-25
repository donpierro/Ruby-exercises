require './zad7.rb'

describe 'SendTweet' do

  it "prints tweet with hashtags and author" do
    expected_tweet = "I've just learnt how to write DSL in Ruby! Whoa! #DSL #Ruby @yukihiro_matz"

    expect {
      SendTweet.new do
        text "I've just learnt how to write DSL in Ruby! Whoa!"
        hashtag "DSL"
        hashtag "Ruby"
        mention "yukihiro_matz"
      end
    }.to output(expected_tweet).to_stdout
  end
end