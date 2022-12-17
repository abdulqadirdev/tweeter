class Tweet < ApplicationRecord
  belongs_to :user
  validates :body, length: {maximum: 240}, allow_blank: false unless :tweet_id
  belongs_to :tweet, optional: true
  has_many :comments

def tweet_type
  if tweet_id? && body? 
     "quote_tweet"
  elsif tweet_id?
    "retweet"
  else
    "tweet"
  end
end

end
