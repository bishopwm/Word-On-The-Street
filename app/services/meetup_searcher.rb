class MeetupSearcher

	def get_meetup_results(coordinates, parameters)

	  @meetup_events = []	

	  account_key = ENV["meetup_searcher_account_key"]
	  text = parameters[:term]
	  latitude = coordinates[:latitude]
	  longitude = coordinates[:longitude]
		responses = HTTParty.get("https://api.meetup.com/2/open_events?key=#{account_key}&lat=#{latitude}&text=#{text}&lon=#{longitude}")

		responses["results"].each do |result|
			next if result['venue'].nil?
		  @meetup_events << {
		  	'event' => result['name'],
		  	'address' => result['venue']['address_1'],
		  	'coordinates' => [result['venue']['lat'], result['venue']['lon']],
		  	'who' => result['group']['who'],
		  	'url' => result['event_url']
		  }
		end

		@meetup_events

	end
	

end
