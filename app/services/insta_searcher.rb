class InstaSearcher

	def get_insta_results(coordinates, parameters)
	  client_id = ENV["instagram_client_id"]
	  client_secret = ENV["instagram_client_secret"]


	  @insta_contents = []	

	  access_token = ENV["instagram_access_token"]
	  tag = parameters[:term]
	  latitude = coordinates[:latitude]
	  longitude = coordinates[:longitude]
	  content_request = HTTParty.get("https://api.instagram.com/v1/media/search?lat=#{latitude}&lng=#{longitude}&access_token=#{access_token}&tag=#{tag}")
	  							  
		content_request['data'].each do |insta_info|
			# next if insta_info['location']['name'].nil?
		  @insta_contents << {
		  	'image' => insta_info['images']['standard_resolution'],
		  	'hashtag' => insta_info['tags'],
		  	'coordinates' => [insta_info['location']['latitude'],insta_info['location']['longitude']],
		  	'location_name' => insta_info['location']['name']
		  }
	
		end #if content_request["data"]
		@insta_contents

	end
	
end