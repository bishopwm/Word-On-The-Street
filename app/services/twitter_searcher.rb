class TwitterSearcher



	def initialize

		@client = Twitter::REST::Client.new do |config|
		  config.access_token        = ENV["twitter_access_token"]
		  config.access_token_secret = ENV["twitter_access_token_secret"]
		  config.consumer_key        = ENV["twitter_consumer_key"]
		  config.consumer_secret     = ENV["twitter_consumer_secret"]
		  # access_token = prepare_access_token(User.last.access_token, User.last.access_secret)
		end

	end

	def get_twitter_results(twitter_term, latitude, longitude, user_city)
		current_city = user_city
		recent_tweets = []
		@client.search("#{current_city} #{twitter_term[:term]} -rt", result_type: "mixed").take(20).each do |tweet|
												#geocode: "#{latitude}, #{longitude},2mi"
		  recent_tweets << {
		  	:tweet => tweet.text
		  }
		end

		recent_tweets

	end

end

# 	def prepare_access_token(oauth_token, oauth_token_secret)
# 	    consumer = OAuth::Consumer.new(ENV["twitter_consumer_key"], ENV["twitter_consumer_secret"], { :site => "https://api.twitter.com", :scheme => :header })

# 	    token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }
# 	    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
	 
# 	    return access_token
# 	end



# response = access_token.request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")


# end



