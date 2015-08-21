class FacebookSearcher

	def get_facebook_results(user_city, parameters)
		query = parameters[:term]
	  current_city = user_city 

		oauth_token = "CAAKMOSnC5n4BAFHtYZBqOojCh4Q6WKrfdppg8Rn4KJykAQVLdSlH7EtZA2Wf2rZBrVnoIB8UoVxEpBxPSKBrUbwiPZBsf6rS4ND8rorYeIiBURVjFkRbNVUrkRqzqW8NvPzOsnxiHwTFBTUZCXIy2yaMZCGqeIeGYqbHdlZAG39XaSLcSu1YZBOieh6BZBfA1wogZD"
	 	app_secret = "f8d720916a1dd1562e084f9701052005"

	 	@facebook_events = []

	  facebook = Koala::Facebook::API.new(oauth_token, app_secret)
		responses = facebook.get_object("search?fields=name&type=event&q=#{query}+#{current_city}")

		responses.each do |facebook_event|
			@facebook_events << {
				'name' => facebook_event["name"],
				'id' => facebook_event["id"]
			}
		end
		@facebook_events

	end

end

