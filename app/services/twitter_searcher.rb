class TwitterSearcher
	attr_accessor :client


	def initialize

		@client = Twitter::REST::Client.new do |config|
		  config.access_token        = ENV["twitter_access_token"]
		  config.access_token_secret = ENV["twitter_access_token_secret"]
		  config.consumer_key        = ENV["twitter_consumer_key"]
		  config.consumer_secret     = ENV["twitter_consumer_secret"]

		end

	end

# To add geocode back:  geocode:"#{latitude},#{longitude},10mi"
	def get_twitter_results(twitter_term)
		recent_tweets = []
	client.search("#{twitter_term} -rt", result_type: "recent" ).take(3).collect do |tweet|
	  recent_tweets << {
	  	:tweet => tweet.text
	  }
	end
	recent_tweets
	end





end

