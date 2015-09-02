class FacebookSearcher

	def get_facebook_results(user_city, parameters)
		if User.last[:access_token].nil?
			@facebook_events == nil
		else
			query = parameters[:term]
		  	current_city = user_city 

		  	oauth_token = User.last.access_token
		 	app_secret = ENV["facebook_app_secret"]

		 	@facebook_events = []

		  	facebook = Koala::Facebook::API.new(oauth_token, app_secret)
			responses = facebook.get_object("search?fields=name&type=event&q=#{query}+#{current_city}")

			responses.each do |facebook_event|
				@facebook_events << {
					'name' => facebook_event["name"]
					
				}
			end
			
			@facebook_events
		end
	end

end

