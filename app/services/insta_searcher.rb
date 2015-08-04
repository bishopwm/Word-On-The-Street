class InstaSearcher

	def get_insta_results(coordinates, parameters)
	  client_id = ENV["instagram_client_id"]
	  client_secret = ENV["instagram_client_secret"]


	  # auth_request = HTTParty.get("https://instagram.com/oauth/authorize/?client_id=#{client_id}&redirect_uri=#{redirect_uri}&response_type=token")

	  @insta_contents = []	

	  access_token = ENV["instagram_access_token"]
	  tag = parameters[:term]
	  latitude = coordinates[:latitude]
	  longitude = coordinates[:longitude]
	  content_request = HTTParty.get("https://api.instagram.com/v1/media/search?lat=41.3916642&lng=2.1768958&access_token=#{access_token}&tag=#{tag}")
	  								  # https://api.instagram.com/v1/media/search?lat=41.3916642&lng=2.1768958&access_token=#{access_token}&tag=#{tag}
	  								  # https://api.instagram.com/v1/tags/{tag-name}/media/lat=#{latitude}&lng=#{longitude}&access_token=#{access_token}
	  								  # https://api.instagram.com/v1/media/search?lat=#{latitude}&lng=#{longitude}&access_token=#{access_token}&tag=#{tag}
		content_request["data"].each do |datum|

		  @insta_contents << {
		  	'image' => datum['images']['standard_resolution'],
		  	'hashtag' => datum['tags'],
		  	'coordinates' => [datum['location']['latitude'],datum['location']['longitude']],
		  	'location_name' => datum['location']['name']
		  }
		end if content_request["data"]
		@insta_contents

	end
end