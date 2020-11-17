# frozen_string_literal: true

class Tweeter
  include Enumerable

  def initialize
    @tweets = []
  end

  def tweet(message)
    @tweets << message.chars[0..143].join
  end

  def each(&block)
    @tweets.each(&block)
    @tweets
  end
end

t = Tweeter.new

# Add some tweets to our @tweets array
t.tweet('first message')
t.tweet('second message')

# Use Enumerable methods on the Tweeter instance
t.each { |msg| puts msg }

# Note: You should NOT have defined this method explicitly!
#   ...it should come from Enumerable by default.
p t.map(&:upcase)
