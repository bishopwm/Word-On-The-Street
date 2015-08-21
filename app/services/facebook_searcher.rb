class FacebookSearcher

	def get_facebook_results(coordinates, parameters)
		query = parameters[:term]
	  latitude = coordinates[:latitude]
	  longitude = coordinates[:longitude]

		oauth_token = "CAAKMOSnC5n4BAFHtYZBqOojCh4Q6WKrfdppg8Rn4KJykAQVLdSlH7EtZA2Wf2rZBrVnoIB8UoVxEpBxPSKBrUbwiPZBsf6rS4ND8rorYeIiBURVjFkRbNVUrkRqzqW8NvPzOsnxiHwTFBTUZCXIy2yaMZCGqeIeGYqbHdlZAG39XaSLcSu1YZBOieh6BZBfA1wogZD"
	 	app_secret = "f8d720916a1dd1562e084f9701052005"

	  facebook = Koala::Facebook::API.new(oauth_token, app_secret)
		# response = facebook.get_object("search?fields=name&center=#{latitude},#{longitude}&type=event&q=#{query}")
		response = facebook.get_object("search?fields=name&type=event&q=#{query}+#{city}")
	end
	fail
end

