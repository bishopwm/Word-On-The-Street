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

	def get_twitter_results(twitter_term, latitude, longitude)
		recent_tweets = []
		@client.search("#barcelona #{twitter_term[:term]}", result_type: "recent" ).take(3).each do |tweet|
												#geocode: "#{latitude}, #{longitude},2mi"
		  recent_tweets << {
		  	:tweet => tweet.text
		  }
		end

		recent_tweets

	end





end

