class InstaSearcher

	def get_insta_results(coordinates, parameters)
	  client_id = ENV["instagram_client_id"]
	  client_secret = ENV["instagram_client_secret"]


	  @insta_contents = []	

	  access_token = ENV["instagram_access_token"]
	  tag = parameters[:term]
	  latitude = coordinates[:latitude]
	  longitude = coordinates[:longitude]
	  content_request = HTTParty.get("https://api.instagram.com/v1/media/search?lat=41.3916642&lng=2.1768958&access_token=#{access_token}&tag=#{tag}")
	  								  
		content_request["data"].each do |datum|

		  @insta_contents << {
		  	'image' => datum['images']['standard_resolution'],
		  	'hashtag' => datum['tags'],
		  	'coordinates' => [datum['location']['latitude'],datum['location']['longitude']],
		  	'location_name' => datum['location']['name']
		  }
		end #if content_request["data"]
		@insta_contents

	end
end